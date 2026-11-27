return
{
    'nvim-mini/mini.nvim', version = false,
    config = function()
        require("mini.diff").setup()

        require("mini.cmdline").setup()

        require("mini.completion").setup()

        require("mini.files").setup()

        require("mini.indentscope").setup()

        require("mini.notify").setup()

        require("mini.pairs").setup()

        require("mini.pick").setup()

        require("mini.statusline").setup()

        require("mini.git").setup()

        require("mini.tabline").setup()

        require("mini.starter").setup(
            {
            autoopen = true,
            header =
            [[
    ▄   ▄███▄   ████▄     ▄   ▄█ █▀▄▀█
     █  █▀   ▀  █   █      █  ██ █ █ █
 ██   █ ██▄▄    █   █ █     █ ██ █   █
 █ █  █ █▄   ▄▀ ▀████  █    █ ▐█ █   █
 █  █ █ ▀███▀           █  █   ▐    █ 
 █   ██                  ██        ▀  
                         ▐            
            ]],
            items =
                {
                    -- Shortcuts section
                    {
                        name = "Code Workspace",
                        action = function()
                            vim.cmd.cd("~/Projects/neovim_code")
                            require("mini.starter").close()
                            require("mini.files").open()
                        end,
                        section = "Shortcuts",
                    },
                    { name = "Find",      action = "Pick files",     section = "Shortcuts" },
                    { name = "Live Grep", action = "Pick grep_live", section = "Shortcuts" },

                    -- Recent Files section
                    require("mini.starter").sections.recent_files(3, false, false),

                    -- Config & System section
                    { name = "Config",       action = function ()
                        local config_dir = vim.fn.stdpath("config")
                        vim.cmd.cd(config_dir)
                        vim.cmd.edit(config_dir .. "/init.lua")
                    end, section = "Config" },
                    { name = "Lazy Plugins", action = "Lazy",       section = "Config" },
                    { name = "Restart",      action = "restart",    section = "Config" },
                    { name = "Quit",         action = "qa",         section = "Config" },
                },
                footer = function()
                    local v = vim.version()
                    local vim_str = string.format("%s.%s.%s", v.major, v.minor, v.patch)
                    local padding = string.rep("\n", 4)

                    if vim.g.neovide then
                        local neovide_str = vim.trim(string.gsub(vim.fn.system("neovide --version"), "neovide ", ""))
                        return padding .. "Neovim version: " .. vim_str .. " | Neovide version: " .. neovide_str
                    else
                        return padding .. "Neovim version: " .. vim_str
                    end
                end,
                content_hooks =
                {
                    require("mini.starter").gen_hook.adding_bullet("▶ "),
                    require("mini.starter").gen_hook.aligning("center", "center"),
                },
            }
        )
    end
}
