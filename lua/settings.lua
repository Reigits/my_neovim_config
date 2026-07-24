-- SETTINGS

-- Set <space> as the leader key
-- See `:h mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '

-- OPTIONS

-- See `:h vim.o`
-- NOTE: You can change these options as you wish!
-- For more options, you can see `:h option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`
-- (Note the single quotes)

vim.o.number = true -- Show line numbers in a column.
vim.o.wrap = false -- Disable the wrap
vim.o.winborder = 'rounded' -- default border for floating window
vim.opt.fillchars = { eob = ' '} -- Removed the '~' from the end of buffer

-- Show line numbers relative to where the cursor is.
-- Affects the 'number' option above, see `:h number_relativenumber`.
vim.o.relativenumber = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = false
vim.o.smartcase = true

vim.o.cursorline = true -- Highlight the line where the cursor is on.
vim.o.scrolloff = 10 -- Keep this many screen lines above/below the cursor.
vim.o.list = false -- hide <tab> and trailing spaces.

-- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s). See `:h 'confirm'`
vim.o.confirm = false

-- configure the indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- set the update time
vim.opt.updatetime = 256

-- configure the statusline to only have 1 of its kind
vim.opt.laststatus = 3

-- needed for bufferline to work
vim.opt.termguicolors = true

-- FOLDING STUFF
vim.o.foldmethod = 'expr' -- set the method to expression
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- and use treesitter by default if the lsp doesnt support the folding
vim.o.foldlevel = 99 -- basically open all fold when opening a new buffer
vim.o.foldlevelstart = 99 -- basically force all the fold to be opened from the start

-- AUTOCOMMANDS (EVENT HANDLERS) --

-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- change to using lsp if the thing actually support the folding (rn i disabled it cuz treesitter works better)
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client:supports_method('textDocument/foldingRange') then
--       local win = vim.api.nvim_get_current_win()
--       vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
--     end
--   end,
-- })


-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- auto diagnostic on hover that you CANNOT focus
vim.api.nvim_create_autocmd('CursorHold',
{
    desc = 'diagnostic on hover',
    command = 'lua vim.diagnostic.open_float({ focusable = false })',
})

-- Sync clipboard between OS and Neovim. Schedule the setting after `UIEnter` because it can
-- increase startup-time. Remove this option if you want your OS clipboard to remain independent.
-- See `:h 'clipboard'`
vim.api.nvim_create_autocmd('UIEnter',
{
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

-- USER COMMANDS: DEFINE CUSTOM COMMANDS --

-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }):wait().stdout)
end, { desc = 'Print the git blame for the current line' })
