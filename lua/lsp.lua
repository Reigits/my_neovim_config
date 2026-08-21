vim.lsp.config('basedpyright', {
  cmd = { 'basedpyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },
})
vim.lsp.enable("basedpyright")

vim.lsp.config('clangd', {
   cmd =
   {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--query-driver=/run/current-system/sw/bin/*,/**/clang,/**/gcc,/**/g++',
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  root_markers = { '.git', 'compile_commands.json', 'compile_flags.txt' },
})
vim.lsp.enable("clangd")

vim.lsp.enable("jdtls")

vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.git', '.luarc.json', '.luarc.jsonc' },
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})
vim.lsp.enable("lua_ls")
