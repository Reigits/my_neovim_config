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
	hl.CursorLine   = { bg = "#1a1a1a" }
	hl.MatchParen   = { fg = "#00ff00" }
    hl.IncSearch    = { fg = "#000000", bg = "#ffffff"} -- this is for when yanking the text those that briefly show what text being yanked
    hl.Visual       = { bg = "#2d2d2d"}

    -- color for certain keyword
	hl["@keyword"]  = { fg = "#719e37" }
    hl["@keyword.import"] = { fg = "#D14D41"}
	hl["@keyword.function"] = { fg = "#719e37" }
	hl["@string"]   = { fg = "#3AA99F" }
	hl["@comment"]  = { fg = "#4a4a4a"}
	hl["@number"]   = { fg = "#8B7EC8" }
	hl["@boolean"]  = { fg = "#CE5D97" }
	hl["@variable"] = { fg = "#4385BE" }
    hl["@variable.builtin"] = { fg = "#D0A215"}
	hl["@variable.member"] = { fg = "#4385BE" }
	hl["@variable.parameter"] = { fg = "#4385BE" }
	hl["@property"] = { fg = "#4385BE" }
	hl["@field"]    = { fg = "#4385BE" }
	hl["@function"]        = { fg = "#DA702C" }
	hl["@function.builtin"] = { fg = "#DA702C" }
	hl["@function.method"]  = { fg = "#DA702C" }
	hl["@type"]            = { fg = "#D0A215" }
	hl["@type.builtin"]    = { fg = "#767676" }
    hl["@lsp.type.interface"] = { fg = "#D0A215" }
	hl["@operator"]              = { fg = "#bcbcbc" }
	hl["@punctuation.bracket"]   = { fg = "#bcbcbc" }
	hl["@punctuation.delimiter"] = { fg = "#d4d4d4" }
    hl.PreProc = { fg = "#D14D41" }
    hl.Statement = { fg = "#879A39" }
    hl.Special = { fg = "#767676"}

	-- dashboard color setting
	hl.DashboardIcon = { fg = "#569cd6" }
	hl.DashboardDesc = { fg = "#ffffff" }
	hl.DashboardKey = { fg = "#D0A215" }
	hl.DashboardHeader = { fg = "#ffffff" }

	-- neotree color setting
	hl.NeoTreeFileName = { fg = "#ffffff" }
	hl.NeoTreeDirectoryName = { fg = "#ffffff" }
	hl.NeoTreeDirectoryIcon = { fg = "#ffc766" }
	hl.NeoTreeRootName = { fg = "#a0a0a0" }
	hl.NeoTreeGitModified = { fg = "#DA702C" }
	hl.NeoTreeIndentMarker = { fg = "#4a4a4a" }
    hl.FloatBorder = { fg = "#767676" }

    -- noice color setting
    hl.NoiceCmdlinePopupBorder = { fg = "#767676" }
    hl.NoiceCmdlinePopupTitle  = { fg = "#767676" }
    hl.NoiceCmdlineIcon        = { fg = "#767676" }

    hl.NoiceCmdlineIconInput        = { fg = "#767676" }
    hl.NoiceCmdlinePopupBorderInput = { fg = "#767676" }
    hl.NoiceCmdlinePopupTitleInput  = { fg = "#767676" }

    hl.NoiceCmdlineIconLua        = { fg = "#767676" }
    hl.NoiceCmdlinePopupBorderLua = { fg = "#767676" }
    hl.NoiceCmdlinePopupTitleLua  = { fg = "#767676" }
	end,
  },
  -- without this, the option won't be used
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd('colorscheme tokyonight')
  end,
}
