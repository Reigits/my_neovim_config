return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",
                separator_style = "slanted",
                diagnostics = "nvim_lsp",
                show_buffer_close_icons = false,
                show_buffer_icons = true,
                modified_icon = "💾",
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        text_align = "center",
                        separator = false,
                        highlight = "NeoTreeNormal",
                    }
                },
                close_command = "bdelete! %d",
            },
                highlights = {
                        buffer_selected = {
                            -- Force the active tab to be normal text
                            italic = false,
                    },
                }
        })

        -- CUSTOM KEYBINDING LOGIC
        vim.keymap.set("n", "<leader>x", function()
            -- 1. Grab the ID of the current buffer (the one we want to close)
            local current_buf = vim.api.nvim_get_current_buf()
            -- 2. Get a list of all real files
            local buffers = vim.fn.getbufinfo({ buflisted = 1 })
            -- 3. The Logic
            if #buffers > 1 then
                -- CASE A: Other files exist
                -- Switch to the previous buffer FIRST to keep the window open
                vim.cmd("bprevious")
                -- THEN delete the old buffer by its ID
                vim.cmd("bdelete! " .. current_buf)
            else
                -- CASE B: This is the last file
                vim.cmd("Neotree focus") -- Move to Explorer
                vim.cmd("bdelete! " .. current_buf) -- Delete the file
            end
        end, { desc = "Close buffer safely" })
        -- === 1. NAVIGATION KEYMAPS ===
        -- Go to PREVIOUS buffer (Left)
        vim.keymap.set("n", "+", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })

        -- Go to NEXT buffer (Right)
        vim.keymap.set("n", "_", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
    end
}
