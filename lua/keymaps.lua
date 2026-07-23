-- KEYMAPS
--
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>') -- use <Esc> to exit terminal mode

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
vim.keymap.set({ 'n' }, '<leader>w', ':w<CR>') -- save file
vim.keymap.set({ 'n' }, '<leader>i', ':Inspect<CR>') -- inspect element
vim.keymap.set({ 'n' }, '<leader>x', ':bd<CR>') -- delete current buffer
vim.keymap.set({ 'n' }, '<leader>c', function()
    local file_name_and_directory = vim.fn.expand('%:p')
    local file_name = vim.fn.expand('%:t')
    local file_name_no_extension_and_directory = vim.fn.expand('%:p:r')
    local file_name_no_extension = vim.fn.expand('%:p:t:r')
    local file_directory = vim.fn.expand('%:p:h')
    local file_extension = vim.fn.expand('%:e')
    local cmd = ''
    --
    -- for debugging purposes
    -- print('the file name and the directory is ' .. file_name_and_directory)
    -- print('the file name is ' .. file_name)
    -- print('the file name without extension and directory is ' .. file_name_no_extension_and_directory)
    -- print('the file name without extension is ' .. file_name_no_extension)
    -- print('the file directory is ' .. file_directory)
    -- print('the file extension is ' .. file_extension) 
    --
    -- if its a python file
    if file_extension == 'py' then
        cmd = 'clear && python ' .. file_name_and_directory
    -- if its a c file
    elseif file_extension == 'c' then
        cmd = 'clear && gcc ' .. file_name_and_directory .. ' -o ' .. file_name_no_extension_and_directory .. ' && ' .. file_name_no_extension_and_directory
    -- if its a java file
    elseif file_extension == 'java' then
        -- find the project root
        local source_directory = vim.fs.root(0, 'src')
        -- if it doesnt found the 'src' folder, fallback to the file directory
        if not source_directory then
            source_directory = file_directory
        end
        -- the bin folder
        local bin_folder = source_directory .. '/bin'
        --debugging purposes again
        -- print('the source directory is ' .. source_directory)
        -- print('the bin folder is in ' .. bin_folder)
        --
        cmd = 'clear && mkdir -p ' .. bin_folder .. ' && javac -d ' .. bin_folder .. ' ' .. file_name_and_directory .. ' && java -cp ' .. bin_folder .. ' ' .. file_name_no_extension
    else
        print('Unknown file type!')
        return
    end
    -- the cmd had to be wrapped in "" so its considered a single command
    require('toggleterm').exec(cmd)
end) -- compile and run the program

-- PLUGINS RELATED KEYMAPS --

vim.keymap.set({ 'n' }, '<leader>e', ':Neotree toggle<CR>') -- open sidebar
vim.keymap.set({ 'n' }, '<leader>\\', ':ToggleTerm<CR>') -- open terminal
vim.keymap.set({ 'n' }, '<leader>q', function()
    vim.cmd('Neotree close')
    vim.cmd('%bdelete')
    vim.cmd('Dashboard')
end
) -- go back to dashboard

vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>") -- telescope to find files
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>") -- telescope to live and grab files with grep
vim.keymap.set('n', '<leader>fb', ":Telescope buffers<CR>") -- telescope to find buffer
vim.keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>") -- telescope to find help tags
