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
                added    = { fg = '#39ff14' },
                modified = { fg = '#ff8700' },
                removed  = { fg = '#ff4500' },
            }
        },
        {
            'diagnostics'
        },	
    }
}
}
}
