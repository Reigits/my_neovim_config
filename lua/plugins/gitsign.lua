return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      -- Toggles what actually gets highlighted
      signcolumn = true,  -- Shows the symbols next to the numbers
      numhl      = false, -- Set to true if you want the actual line number to change color
      linehl     = false, -- Set to true if you want the entire line background to light up (usually too distracting)
    })
  end
}
