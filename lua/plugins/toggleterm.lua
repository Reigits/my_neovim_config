return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup({
            -- Size of the terminal (can be a percentage)
            size = 20, 
            
            -- Key to trigger it (standard is Ctrl + \)
            -- You can change this to Ctrl + ` if you prefer
            open_mapping = [[<c-\>]], 
            
            -- Make it look nice
            direction = 'float', -- Options: 'vertical', 'horizontal', 'float'
            float_opts = {
                border = 'curved', -- rounded corners
            },
        })
    end
}
