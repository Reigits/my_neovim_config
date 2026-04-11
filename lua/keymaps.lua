vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save the file'})
-- Maps <leader>q (Space + q) to wipe the desk and return to the dashboard
vim.keymap.set('n', '<leader>q', '<cmd>Neotree close<CR><cmd>enew<CR><cmd>Dashboard<CR>', { desc = 'Quit to Dashboard' })

-- The ultimate Home Row escape trick
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

local builtin = require('telescope.builtin')

-- ==========================================================
-- 1. THE ESSENTIALS (Memorize these first)
-- ==========================================================

-- Find Files: Search for files by name (Ctrl+P equivalent)
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })

-- Live Grep: Search for TEXT inside all files (VS Code's search sidebar)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

-- Buffers: Switch between open files (like Alt+Tab for code)
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

-- Help Tags: Search Neovim documentation (Crucial for learning!)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- THE NEW INLINE RENAME HOTKEY: Press Space + r
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Code Rename (LSP)" })


-- ==========================================================
-- 2. POWER USER TOOLS (Very useful)
-- ==========================================================

-- Old Files: Shows a history of files you opened recently
-- Great for "Wait, what was I working on yesterday?"
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Find old files' })

-- Current Buffer Search: Like Ctrl+F, but with fuzzy search inside the current file
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = 'Fuzzy search in current buffer' })

-- Find Word: Search for the word UNDER your cursor
-- Usage: Move cursor to "hack_cycle", press <leader>fw, and see every place it's used.
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Find word under cursor' })

-- Press 'gl' to show the error message in a floating window
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
-- Jump to next error (New "Jump" syntax)
vim.keymap.set('n', ']d', function()
    vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next Diagnostic" })

-- Jump to previous error
vim.keymap.set('n', '[d', function()
    vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Prev Diagnostic" })

vim.keymap.set('n', '<leader>c', function()
    vim.cmd("w")

    -- THE UPGRADE: Use %:p to grab the exact Absolute Path on your hard drive
    -- %:p   = Full path (e.g., "C:/Users/Rei/.../src/test.c")
    -- %:p:r = Full path no extension (e.g., "C:/Users/Rei/.../src/test")
    -- %:p:h = Full directory path (e.g., "C:/Users/Rei/.../src")
    local full_path = vim.fn.expand("%:p")
    local full_path_no_ext = vim.fn.expand("%:p:r")
    local file_dir = vim.fn.expand("%:p:h")
    -- We still need these for Java
    local file_tail = vim.fn.expand("%:t")
    local file_tail_no_ext = vim.fn.expand("%:t:r")
    local ext = vim.fn.expand("%:e")
    local cmd = ""

    if ext == "c" then
        -- Result: gcc "C:/.../test.c" -o "C:/.../test.exe" && "C:/.../test.exe"
        cmd = "gcc \"" .. full_path .. "\" -o \"" .. full_path_no_ext .. ".exe\" && \"" .. full_path_no_ext .. ".exe\""
    elseif ext == "py" then
        -- Result: python "C:/.../main.py"
        cmd = "python \"" .. full_path .. "\""
    elseif ext == "java" then
        -- Java is stubborn and hates absolute paths for execution. 
        -- We temporarily 'cd' the terminal into the folder just for this one command.
        -- (The '/d' ensures it works flawlessly on Windows CMD).
        cmd = "cd /d \"" .. file_dir .. "\" && javac \"" .. file_tail .. "\" && java \"" .. file_tail_no_ext .. "\""
    else
        print("Unknown file type!")
        return
    end

  require("toggleterm").exec(cmd, 1, 20, nil, "float")

end, { desc = "Save and Run Code" })
