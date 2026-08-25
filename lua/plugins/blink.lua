-- autocompletion engine
return
{
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },
  -- use a release tag to download pre-built binaries
  version = '1.*',
  opts =
  {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    -- 
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'super-tab' },
    appearance =
    {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },
    -- (Default) Only show the documentation popup when manually triggered
    completion =
    {
        documentation =
        {
            auto_show = false -- dont show documentation unless pressing ctrl + space
        },
    },
    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources =
    {
      default = { 'lsp', 'path', 'buffer' }, -- never use the snippet
      providers =
      {
          lsp =
          {
              score_offset = 100, -- prioritize lsp
          }
      }
    },
    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation, and
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy =
    {
        implementation = "prefer_rust_with_warning",
        sorts = { 'exact', 'score', 'sort_text' }, -- previously it was only 'exact', it turns out to have caused the menu to be completely scrambled
    },
    -- disabled the autocompletion for while on string or comment
    enabled = function ()
        if vim.bo.filetype == 'markdown' then
            return false
        end
        local success, node = pcall(vim.treesitter.get_node) -- we need to get the node type first using the treesitter (pcall returns 2 values)
        if success and node then -- if it succeed
            local node_type = node:type() -- get the node type
            if node_type:find('comment') or node_type:find('string') then -- if its either a comment or a string
                return false -- turn the thing off
            end
        end
        return true -- otherwise keep it on
    end
  },
  opts_extend = { "sources.default" }
}
