-- the telescope plugin

return
{
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies =
    {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-ui-select.nvim'
    },
    config = function ()
        local action_set = require("telescope.actions.set")
        local telescope = require("telescope")
        telescope.setup(
        {
            extensions =
            {
                ["ui-select"] =
                {
                    require("telescope.themes").get_dropdown(
                    {
                        previewer = true,
                        layout_config =
                        {
                            width = 0.5,
                            height = 0.5,
                        },
                    }),
                },
            },
            pickers =
            {
                oldfiles =
                {
                    attach_mappings = function (_, _)
                          action_set.select:enhance({
                          post = function()
                          local root = vim.fs.root(0, { ".git", "package.json", "Makefile", "pyproject.toml", "pubspec.yaml" })
                          if root then
                            vim.cmd.cd(root)
                          else
                            vim.cmd("cd %:p:h")
                          end
                        end,
                      })
                      return true
                    end
                }
            }
        })
        telescope.load_extension("ui-select")
    end
}
