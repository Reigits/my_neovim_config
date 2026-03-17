return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons'},
    opts= {
        options = {
            theme = '16color',
            component_separators = '|',
            section_separators = '',
        },
        sections = {
        lualine_z = {
            'location',
            {
            'datetime',
            style = '%H:%M:%S'
            }
            }
        }
    }
}
