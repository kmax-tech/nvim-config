if not vim.g.neovide then
  return
end

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    local nvim_tree = require("nvim-tree")
    local api = require("nvim-tree.api")
    local uv = vim.loop

    -- Get current buffer name
    local buf_name = vim.api.nvim_buf_get_name(0)

    -- Log buffer name to message area
    if buf_name == "" then
      print("No file is currently open in the buffer.")
    else
      print("Current buffer file: " .. buf_name)
    end

    local function get_root_dir()
      if buf_name ~= "" then
        return vim.fn.fnamemodify(buf_name, ":p:h")
      else
        return uv.os_homedir() .. "~/Documents"
      end
    end

    nvim_tree.setup({
      disable_netrw = true,
      hijack_netrw = true,
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
        },
      },
      update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
      },
    })

    local root_dir = get_root_dir()
    api.tree.change_root(root_dir)
    api.tree.open()
  end,
})



-- Other Neovide settings
vim.g.neovide_cursor_hack = true
vim.g.neovide_scale_factor = 1.0
-- vim.g.neovide_transparency = 0.9