-- the telescope plugin

return
{
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies =
    {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-ui-select.nvim'
    },
    config = function ()
        local telescope = require("telescope")
        telescope.setup(
            {
          extensions =
          {
            ["ui-select"] =
            {
              require("telescope.themes").get_dropdown(
              {
                previewer = true,
                layout_config =
                {
                    width = 0.5,
                    height = 0.5,
                },
              }),
            },
          },
        })
        telescope.load_extension("ui-select")
    end
}
