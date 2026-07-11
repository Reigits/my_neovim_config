return
{
'nvim-lualine/lualine.nvim',
dependencies = { 'nvim-tree/nvim-web-devicons' },
opts =
{
    options =
    {
        theme = '16color',
        disabled_filetypes = {'neo-tree'} -- disabled lualine on neotree
    },
sections =
{
    lualine_b =
    {
        {
            'branch'
        },
        {
            'diff',
            diff_color =
            {
                added    = { fg = '#00DD00' },
                modified = { fg = '#FF8800' },
                removed  = { fg = '#EE2436' },
            }
        },
        {
            'diagnostics'
        },
    },
    lualine_z =
    {
        {'location'},
        {
            'datetime',
            style = '%H:%M:%S',
            color =
            {
                bg = '#808080',
                fg = '#ffffff'
            },
            separator = { left = ''}
        },
    }
}
}
}
