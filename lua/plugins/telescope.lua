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
    opts =
    {
        extensions =
        {
        ['ui-select'] =
            {
                layout_strategy = 'center',
                sorting_strategy = 'ascending',
                layout_config =
                {
                  width = 0.3,
                  height = 0.3,
                },
            },
        },
    },
    config = function(_, opts)
        require('telescope').setup(opts)
        require('telescope').load_extension('ui-select')
    end,
}
