-- the theme --

return
{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts =
  {
    style = 'night',
    styles =
	{
      	sidebars = 'dark',
      	floats = 'dark',
	},
    transparent = false,
    terminal_colors = false,

    -- determining some color
    on_colors = function(c)
        -- some background color
      	c.bg = "#000000"
      	c.bg_dark = "#000000"
      	c.bg_sidebar = "#111111"
      	c.bg_float = "#252526"

        -- git colors
        c.git =
        {
            add = '#00DD00',
            change = '#FF8800',
            delete = '#EE2436',
        }
    end,

    on_highlights = function(hl, c)
	-- normal ui thing
	hl.Normal       = { fg = "#d4d4d4", bg = c.bg }
	hl.WinSeparator = { fg = "#000000", bg = c.bg }
	hl.LineNr       = { fg = "#5a5a5a" }
	hl.LineNrAbove  = { fg = "#5a5a5a" }
	hl.LineNrBelow  = { fg = "#5a5a5a" }
	hl.CursorLineNr = { fg = "#c6c6c6" }
	hl.CursorLine   = { bg = "#3a3a3a" }
	hl.MatchParen   = { fg = "#00ff00" }

    -- color for certain keyword
	hl["@keyword"]  = { fg = "#719e37" }
	hl["@keyword.function"] = { fg = "#719e37" }
	hl["@string"]   = { fg = "#4ba393" }
	hl["@comment"]  = { fg = "#4a4a4a"}
	hl["@number"]   = { fg = c.purple }
	hl["@boolean"]  = { fg = c.magenta }
	hl["@variable"] = { fg = "#569cd6" }
	hl["@variable.member"] = { fg = "#569cd6" }
	hl["@variable.parameter"] = { fg = "#569cd6" }
	hl["@property"] = { fg = "#569cd6" }
	hl["@field"]    = { fg = "#9cdcfe" }
	hl["@function"]        = { fg = "#ff8700" }
	hl["@function.builtin"] = { fg = "#ff8700" }
	hl["@function.method"]  = { fg = "#ff8700" }
	hl["@type"]            = { fg = "#4ec9b0" }
	hl["@type.builtin"]    = { fg = "#4ec9b0" }
	hl["@operator"]              = { fg = "#bcbcbc" }
	hl["@punctuation.bracket"]   = { fg = "#bcbcbc" }
	hl["@punctuation.delimiter"] = { fg = "#d4d4d4" }

	-- dashboard color setting
	hl.DashboardIcon = { fg = "#569cd6" }
	hl.DashboardDesc = { fg = "#ffffff" }
	hl.DashboardKey = { fg = "#ce9178" }
	hl.DashboardHeader = { fg = "#ffffff" }

	-- neotree color setting
	hl.NeoTreeFileName = { fg = "#ffffff" }
	hl.NeoTreeDirectoryName = { fg = "#ffffff" }
	hl.NeoTreeDirectoryIcon = { fg = "#ffc766" }
	hl.NeoTreeRootName = { fg = "#a0a0a0" }
	hl.NeoTreeGitModified = { fg = "#ff8700" }
	hl.NeoTreeIndentMarker = { fg = "#4a4a4a" }
	end,
  },
  -- without this, the option won't be used
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd('colorscheme tokyonight')
  end,
}
