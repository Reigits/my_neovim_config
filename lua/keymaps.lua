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
vim.keymap.set({ 'n' }, '<Esc>', ':nohlsearch<CR>') -- remove the highlight when searching a keyword in a file
vim.keymap.set({ 'n' }, '<leader>c', function()
    local file_name_and_directory = vim.fn.expand('%:p')
    local file_name_no_extension_and_directory = vim.fn.expand('%:p:r')
    local file_directory = vim.fn.expand('%:p:h')
    local file_extension = vim.fn.expand('%:e')
    local cmd = ''
     -- if its a python file
    if file_extension == 'py' then
        cmd = 'clear && python ' .. file_name_and_directory
    -- if its a c file
    elseif file_extension == 'c' then
        cmd = 'clear && gcc ' .. file_name_and_directory .. ' -o ' .. file_name_no_extension_and_directory .. ' && ' .. file_name_no_extension_and_directory
    -- if its a java file
    elseif file_extension == 'java' then
        -- find the project root, 0 means the current buffer, 'src' is the target file inside the main directory (it includes the /src)
        -- or fallback to file directory if there isnt any
        local project_root = vim.fs.root(0, 'src') or file_directory
        local source_directory = project_root .. '/src'
        -- the bin folder
        local bin_folder = project_root .. '/bin'
        -- find the relative path of the main class file from 'src'
        local rel_path = vim.fs.relpath(source_directory, file_name_and_directory)
        -- and format the path as a standalone main class
        local main_class = rel_path:gsub('%.java$', ''):gsub('/', '.')
        -- okay this is the explanation, first clear the terminal, and then create the bin folder, then compile every java file
        -- from src to the bin folder and then run the main class inside the bin folder
        cmd = 'clear && mkdir -p "' .. bin_folder .. '" && javac -d "' .. bin_folder .. '" -sourcepath "' .. source_directory .. '" $(find "' .. source_directory .. '" -name "*.java") && java -cp "' .. bin_folder .. '" "' .. main_class .. '"'
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
