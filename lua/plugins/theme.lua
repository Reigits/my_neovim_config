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
    dim_inactive = true,

    -- determining some color
    on_colors = function(c)
        -- some background color
      	c.bg          = "#000000"
        c.bg_dark     = "#000000"
        c.bg_float    = "#111111"
        c.bg_sidebar  = "#111111"
        c.bg_popup    = "#151515"
        c.bg_highlight= "#1a1a1a"
        c.bg_visual   = "#2d2d2d"
        c.bg_search   = "#ffffff"

        c.fg          = "#ffffff"
        c.fg_dark     = "#8c8c8c"
        c.fg_float    = "#ffffff"
        c.fg_gutter   = "#5a5a5a"
        c.fg_sidebar  = "#ffffff"

        c.border           = "#000000"
        c.border_highlight = "#767676"
        -- git colors
        c.git =
        {
            add = '#00DD00',
            change = '#FF8800',
            delete = '#EE2436',
        }

        c.comment = "#4a4a4a"
        c.orange  = "#FF8800"
        c.yellow  = "#D0A215"
        c.green   = "#00DD00"
        c.teal    = "#3AA99F"
        c.cyan    = "#569cd6"
        c.blue    = "#4385BE"
        c.purple  = "#8B7EC8"
        c.magenta = "#CE5D97"
        c.red     = "#EE2436"

        c.terminal_black = "#5a5a5a"
    end,

    on_highlights = function(hl)
        -- normal ui thing
        hl.Normal       = { fg = "#ffffff", bg = "#000000" }
        hl.NormalNC     = { fg = "#8c8c8c"} -- this is the group that determines the color of the non selected buffer
        hl.WinSeparator = { fg = "#000000", bg = "#000000" }
        hl.LineNr       = { fg = "#5a5a5a" }
        hl.LineNrAbove  = { fg = "#5a5a5a" }
        hl.LineNrBelow  = { fg = "#5a5a5a" }
        hl.CursorLineNr = { fg = "#c6c6c6" }
        hl.CursorLine   = { bg = "#1a1a1a" }
        hl.MatchParen   = { fg = "#00ff00" }
        hl.IncSearch    = { fg = "#000000", bg = "#FFFFFF"} -- this is for when yanking the text those that briefly show what text being yankedkj
        hl.CurSearch    = { fg = "#000000", bg = "#FF8800"}
        hl.Search       = { fg = "#000000", bg = "#FF8800"}
        hl.Visual       = { bg = "#2d2d2d"}
        hl.NormalFloat = { bg = "#111111", fg = "#ffffff" }
        hl.FloatBorder = { fg = "#ffffff", bg = "#111111"}

        -- this is for that right click drop down menu
        hl.Pmenu       = { bg = "#151515", fg = "#ffffff" }
        hl.PmenuSel    = { bg = "#4a4a4a", fg = "#ffffff" }
        hl.PmenuBorder = { fg = "#ffffff", bg = "#ffffff" }

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
        hl.DashboardFooter = { fg = "#4a4a4a"}

        -- neotree color setting
        hl.NeoTreeFileName = { fg = "#ffffff" }
        hl.NeoTreeDirectoryName = { fg = "#ffffff" }
        hl.NeoTreeDirectoryIcon = { fg = "#ffc766" }
        hl.NeoTreeRootName = { fg = "#a0a0a0" }
        hl.NeoTreeGitModified = { fg = "#DA702C" }
        hl.NeoTreeGitUntracked = { fg = "#D0A215"}
        hl.NeoTreeIndentMarker = { fg = "#4a4a4a" }
        hl.FloatBorder = { fg = "#767676" }
        hl.NeoTreeNormal = { fg = "#ffffff", bg = "#111111"}

        -- noice color setting
        hl.NoiceCmdlinePopupBorder = { fg = "#ffffff" }
        hl.NoiceCmdlinePopupTitle  = { fg = "#ffffff" }
        hl.NoiceCmdlineIcon        = { fg = "#ffffff" }

        hl.NoiceCmdlineIconInput        = { fg = "#ffffff" }
        hl.NoiceCmdlinePopupBorderInput = { fg = "#ffffff" }
        hl.NoiceCmdlinePopupTitleInput  = { fg = "#ffffff" }

        hl.NoiceCmdlineIconLua        = { fg = "#767676" }
        hl.NoiceCmdlinePopupBorderLua = { fg = "#767676" }
        hl.NoiceCmdlinePopupTitleLua  = { fg = "#767676" }

        -- telescope color setting
        hl.TelescopeBorder = { bg = "#111111", fg = "#767676"}
        hl.TelescopeNormal = { bg = "#000000", fg = "#ffffff"}
        hl.TelescopePromptBorder = { bg = "#000000", fg = "#ffffff"}
        hl.TelescopePromptTitle = { bg = "#000000", fg = "#ffffff"}
        hl.TelescopeResultsComment = { fg = "#4a4a4a"}
        hl.TelescopePromptCounter = { fg = "#4a4a4a"}

        -- barbar color setting
        hl.BufferTabpageFill = { bg = "#000001", fg = "#5a5a5a" }
        hl.BufferTabpages    = { bg = "#000000", fg = "#5a5a5a" }
        hl.BufferOffset      = { bg = "#111111", fg = "#767676" }

        hl.BufferCurrent        = { bg = "#000000", fg = "#ffffff", bold = true }
        hl.BufferCurrentSign    = { bg = "#000000", fg = "#ffffff", bold = true }
        hl.BufferCurrentIndex   = { bg = "#000000", fg = "#D0A215" }
        hl.BufferCurrentMod     = { bg = "#000000", fg = "#FF8800" }
        hl.BufferCurrentTarget  = { bg = "#000000", fg = "#EE2436", bold = true }

        hl.BufferCurrentADDED   = { bg = "#000000", fg = "#00DD00" }
        hl.BufferCurrentCHANGED = { bg = "#000000", fg = "#FF8800" }
        hl.BufferCurrentDELETED = { bg = "#000000", fg = "#EE2436" }
        hl.BufferCurrentERROR   = { bg = "#000000", fg = "#EE2436" }
        hl.BufferCurrentWARN    = { bg = "#000000", fg = "#D0A215" }
        hl.BufferCurrentINFO    = { bg = "#000000", fg = "#569cd6" }
        hl.BufferCurrentHINT    = { bg = "#000000", fg = "#3AA99F" }

        hl.BufferInactive        = { bg = "#151515", fg = "#8c8c8c" }
        hl.BufferInactiveSign    = { bg = "#151515", fg = "#4a4a4a" }
        hl.BufferInactiveIndex   = { bg = "#151515", fg = "#5a5a5a" }
        hl.BufferInactiveMod     = { bg = "#151515", fg = "#FF8800" }
        hl.BufferInactiveTarget  = { bg = "#151515", fg = "#EE2436", bold = true }

        hl.BufferInactiveADDED   = { bg = "#151515", fg = "#00DD00" }
        hl.BufferInactiveCHANGED = { bg = "#151515", fg = "#FF8800" }
        hl.BufferInactiveDELETED = { bg = "#151515", fg = "#EE2436" }
        hl.BufferInactiveERROR   = { bg = "#151515", fg = "#EE2436" }
        hl.BufferInactiveWARN    = { bg = "#151515", fg = "#D0A215" }
        hl.BufferInactiveINFO    = { bg = "#151515", fg = "#569cd6" }
        hl.BufferInactiveHINT    = { bg = "#151515", fg = "#3AA99F" }

        hl.BufferAlternate       = { bg = "#1a1a1a", fg = "#c6c6c6" }
        hl.BufferAlternateSign   = { bg = "#1a1a1a", fg = "#4a4a4a" }
        hl.BufferAlternateIndex  = { bg = "#1a1a1a", fg = "#5a5a5a" }
        hl.BufferAlternateMod    = { bg = "#1a1a1a", fg = "#FF8800" }
        hl.BufferAlternateTarget = { bg = "#1a1a1a", fg = "#EE2436", bold = true }

        hl.BufferVisible        = { bg = "#111111", fg = "#ffffff" }
        hl.BufferVisibleSign    = { bg = "#111111", fg = "#4a4a4a" }
        hl.BufferVisibleIndex   = { bg = "#111111", fg = "#767676" }
        hl.BufferVisibleMod     = { bg = "#111111", fg = "#FF8800" }
        hl.BufferVisibleTarget  = { bg = "#111111", fg = "#EE2436", bold = true }
	end,
  },
  -- without this, the option won't be used
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd('colorscheme tokyonight')
  end,
}
