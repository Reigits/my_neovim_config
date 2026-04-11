return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  opts = {
      theme = "doom",
      config = {
          header = vim.split([[







   ▄   ▄███▄   ████▄     ▄   ▄█ █▀▄▀█
    █  █▀   ▀  █   █      █  ██ █ █ █
██   █ ██▄▄    █   █ █     █ ██ █ ▄ █
█ █  █ █▄   ▄▀ ▀████  █    █ ▐█ █   █
█  █ █ ▀███▀           █  █   ▐    █ 
█   ██                  █▐        ▀  
                        ▐            



            ]], '\n'),
        center = {{
          action = 'enew | cd C:/Users/Rei/Documents/neovimCode | Neotree reveal', -- replace with your own code directory!
          desc = ' Code Workspace',
          icon = ' ',
          key = 'w',
        },
        {
          action = 'Telescope oldfiles',
          desc = ' Recent files',
          icon = ' ',
          key = 'r',
        },
        {
          -- Instantly opens Telescope inside your Neovim config folder
          action = 'enew | cd ' .. vim.fn.stdpath('config') .. ' | Neotree reveal',
          desc = ' Config',
          icon = ' ',
          key = 'c',
        },
        {
          action = 'Lazy update',
          desc = ' Update Plugins',
          icon = ' ',
          key = 'U', -- Capital U so you don't accidentally hit it
        },
        {
          action = 'Mason',
          desc = ' Manage LSPs',
          icon = '󱧕 ',
          key = 'M',
        },
        {
          action = 'qa',
          desc = ' Quit',
          icon = ' ',
          key = 'q',
        },
    },
    footer = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        return { "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "⚡ Neovim booted in " .. ms .. "ms" }
    end,
    }
  },
  dependencies = {{'nvim-tree/nvim-web-devicons'}}
}
