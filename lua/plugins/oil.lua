return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  lazy = false, -- Ensure the plugin is loaded immediately
  config = function()
    local oil = require("oil")  -- No need to check, as oil is now guaranteed to be loaded

    oil.setup()

    local detail = false

    -- Keymap to open oil (vim-vinegar style)
    vim.api.nvim_set_keymap("n", "-", "<CMD>Oil<CR>", { noremap = true, silent = true })

    -- Keymap to toggle file detail view
    vim.keymap.set("n", "gd", function()
      detail = not detail
      if detail then
        oil.set_columns({ "icon", "permissions", "size", "mtime" })
      else
        oil.set_columns({ "icon" })
      end
    end, { desc = "Toggle file detail view", noremap = true, silent = true })

    -- Keymap to close oil buffer
    vim.keymap.set("n", "q", function()
      if oil.get_current_dir() then
        vim.cmd("bd") -- Close oil.nvim buffer
      else
        vim.cmd("q") -- Quit normally if not in oil
      end
    end, { desc = "Close oil buffer", noremap = true, silent = true })
  end,
}

