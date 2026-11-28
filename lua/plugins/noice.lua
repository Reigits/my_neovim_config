return
{
    "folke/noice.nvim",
    event = "VeryLazy",
    init = function()
        local orig_inputlist = vim.fn.inputlist
        vim.fn.inputlist = function(items)
            local list = vim.list_extend({}, items)
            table.insert(list, "")
            return orig_inputlist(list)
        end
    end,
    opts =
    {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
          "rcarriga/nvim-notify",
          opts =
          {
              top_down = false,
          }
      }
      }
}
