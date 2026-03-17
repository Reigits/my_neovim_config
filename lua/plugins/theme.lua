return {
    "kepano/flexoki-neovim",
    name = "flexoki",
    lazy = false,
    priority = 1000,
    config = function()
        -- 1. Activate the theme
        vim.cmd("colorscheme flexoki-dark")

        -- 2. FORCE PITCH BLACK BACKGROUND (The "Void" Logic)
        -- We use an Autocmd to ensure this applies AFTER the theme loads
        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            callback = function()
                local void_black = "#000000"
                -- "Normal" is your main coding window
                vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
                vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" }) -- Non-active windows

                -- Optional: Make line numbers blend into the void
                vim.api.nvim_set_hl(0, "LineNr", { bg = "#000000", fg = "#3e3e3e" })
                vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })


                -- 2. THE UI FRAME (Explorer + Top Bar) -> Flexoki Grey (#100F0F)
                local flexoki_grey = "#100F0F"

                -- Explorer (NeoTree)
                vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = flexoki_grey })
                vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = flexoki_grey })
                vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = flexoki_grey })
                vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { bg = flexoki_grey, fg = flexoki_grey })

                -- 3. THE SPLIT LINE (Separator) -> Black
                -- This removes the vertical line by blending it with the code
                vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { bg = void_black, fg = void_black })
                vim.api.nvim_set_hl(0, "WinSeparator", { bg = void_black, fg = void_black })
            end,
        })
        -- Trigger the color update immediately
        vim.cmd("doautocmd ColorScheme")
    end,
}
