-- KEYMAPS
--
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>') -- Use <Esc> to exit terminal mode

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')

vim.keymap.set({ 'i' }, 'jk', '<Esc>') -- exit from insert mode
vim.keymap.set({ 'n' }, '<leader>q', ':q<CR>') -- exit neovim
vim.keymap.set({ 'n' }, '<leader>w', ':w<CR>') -- save file
vim.keymap.set({ 'n' }, '<leader>i', ':Inspect<CR>') -- inspect element

-- PLUGINS RELATED KEYMAPS --

vim.keymap.set({ 'n' }, '<leader>e', ':Neotree toggle<CR>') -- open sidebar
vim.keymap.set({ 'n' }, '<leader>\\', ':ToggleTerm<CR>') -- open terminal
