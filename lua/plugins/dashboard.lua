return
{
  'nvimdev/dashboard-nvim',
  lazy = false,
  event = 'VimEnter',
  opts =
  {
	  theme = 'doom',
	  disable_move = true,
	  hide =
	  {
		  statusline = true,
		  tabline = true,
		  winbar = true,
	  },
	  config =
	  {
		header =
		{
'',
'',
'',
'',
'',
'',
'',
'    ▄   ▄███▄   ████▄     ▄   ▄█ █▀▄▀█',
'     █  █▀   ▀  █   █      █  ██ █ █ █',
' ██   █ ██▄▄    █   █ █     █ ██ █   █',
' █ █  █ █▄   ▄▀ ▀████  █    █ ▐█ █   █',
' █  █ █ ▀███▀           █  █   ▐    █ ',
' █   ██                  ██        ▀  ',
'                         ▐            ',
'',
'',
'',
		},
        	center =
		{
			{
			  action = 'enew | cd /home/rei/Documents/neovim_code | Neotree reveal', -- replace with your own code directory!
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
			  key = 'U',
			},
			{
			  action = 'Mason',
			  desc = ' Manage LSP',
			  icon = '󱧕 ',
			  key = 'M',
			},
			{
			  action = 'restart',
			  desc = ' Restart',
			  icon = ' ',
			  key = 'R',   -- Capital R so it doesn't conflict with 'r' (Recent files)
			},
			{
			  action = 'qa',
			  desc = ' Quit',
			  icon = ' ',
			  key = 'q',
			},
		},
		vertical_center = true,
        footer = function()
            local vim_version = vim.version()
			local vim_str = string.format('%s.%s.%s', vim_version.major, vim_version.minor, vim_version.patch)
            return
            {
'',
'',
'',
'',
'',
'',
'',
'',
'',
'NeoVim version: ' .. vim_str,
            }
        end,
	  },
	},
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
