return
{
'nvim-lualine/lualine.nvim',
dependencies = { 'nvim-tree/nvim-web-devicons' },
opts =
{
    options =
    {
        theme = '16color'
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
    }
}
}
}
