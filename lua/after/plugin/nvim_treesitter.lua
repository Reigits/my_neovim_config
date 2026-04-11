-- Treesitter settings
vim.api.nvim_create_autocmd('FileType', {
  -- REPLACE '<filetype>' with the languages you use
  pattern = { 'c', 'python', 'lua', 'cpp', 'java' },
  callback = function()
    vim.treesitter.start()
  end,
})
