return
{
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts =
  {
    sidebar_filetypes =
    {
      -- prevent the bar from the neo-tree sidebar
      ['neo-tree'] = { event = 'BufWipeout' },
    },

    icons =
    {
        -- Configure the base icons on the bufferline.
        -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
        buffer_index = false,
        buffer_number = false,
        button = false,
        -- Enables / disables diagnostic symbols
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
          [vim.diagnostic.severity.WARN] = {enabled = false},
          [vim.diagnostic.severity.INFO] = {enabled = false},
          [vim.diagnostic.severity.HINT] = {enabled = true},
        },
        gitsigns =
        {
          added = {enabled = true, icon = '+'},
          changed = {enabled = true, icon = '~'},
          deleted = {enabled = true, icon = '-'},
        },
        separator = {left = ' -»' , right = '«- '},
        separator_at_end = false,
    },
    maximum_padding = 1,
    minimum_padding = 1,
    maximum_length = 30,

  },
}
