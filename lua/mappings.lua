local km = vim.keymap


-- Easy add date/time
function date()
  local pos = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, pos) .. "# " .. os.date("%d.%m.%y") .. line:sub(pos + 1)
  vim.api.nvim_set_current_line(nline)
  vim.api.nvim_feedkeys("o", "n", true)
end

km.set("n", "<Leader>xd", "<cmd>lua date()<cr>", { desc = "Insert Date" })

km.set("n", "<Leader><Down>", "<C-W><C-J>", { silent = true, desc = "Window Down" })
km.set("n", "<Leader><Up>", "<C-W><C-K>", { silent = true, desc = "Window Up" })
km.set("n", "<Leader><Right>", "<C-W><C-L>", { silent = true, desc = "Window Right" })
km.set("n", "<Leader><Left>", "<C-W><C-H>", { silent = true, desc = "Window Left" })
km.set("n", "<Leader>wr", "<C-W>R", { silent = true, desc = "Window Resize" })
km.set("n", "<Leader>=", "<C-W>=", { silent = true, desc = "Window Equalise" })



-- Easier window switching with leader + Number
-- Creates mappings like this: km.set("n", "<Leader>2", "2<C-W>w", { desc = "Move to Window 2" })
for i = 1, 4 do
  local lhs = "<Leader>" .. i
  local rhs = i .. "<C-W>w"
  km.set("n", lhs, rhs, { desc = "Move to Window " .. i })
end

-- Fast way of saving keys in nvim
-- vim.api.nvim_set_keymap('n', '<D-s>', ':w<CR>', { noremap = true})
-- vim.api.nvim_set_keymap('i', '<D-s>', '<Esc>:w<CR>i', { noremap = true })

-- Normal mode: ⌘S
vim.keymap.set('n', '<D-s>', function()
  local filename = vim.api.nvim_buf_get_name(0)
  if vim.bo.modified then
    if filename ~= "" then
      vim.cmd('write')
      vim.notify("File saved successfully", vim.log.levels.INFO)
    else
      vim.notify("No file name. Use :saveas to save it first.", vim.log.levels.WARN)
    end
  else
    vim.notify("No changes to save", vim.log.levels.INFO)
  end
end, { noremap = true, desc = "Save file with ⌘S (normal mode)" })

-- Insert mode: ⌘S
vim.keymap.set('i', '<D-s>', function()
  local filename = vim.api.nvim_buf_get_name(0)
  if vim.bo.modified then
    vim.cmd('stopinsert')
    if filename ~= "" then
      vim.cmd('write')
      vim.notify("File saved successfully", vim.log.levels.INFO)
    else
      vim.notify("No file name. Use :saveas to save it first.", vim.log.levels.WARN)
    end
    vim.cmd('startinsert')
  else
    vim.cmd('stopinsert')
    vim.notify("No changes to save", vim.log.levels.INFO)
    vim.cmd('startinsert')
  end
end, { noremap = true, desc = "Save file with ⌘S (insert mode)" })



vim.api.nvim_set_keymap("i", "<D-v>", "<C-r>+", { noremap = true, silent = true }) -- Cmd+V in insert mode
vim.api.nvim_set_keymap("c", "<D-v>", "<C-r>+", { noremap = true, silent = true }) -- Cmd+V in command mode
vim.api.nvim_set_keymap("v", "<D-v>", "_dP", { noremap = true, silent = true }) -- Cmd+V in visual mode
vim.api.nvim_set_keymap("n", "<D-v>", "p", { noremap = true, silent = true }) -- Cmd+V in normal mode
-- Copy in every mode
-- Visual mode copy (when text is selected)
vim.keymap.set('v', '<D-b>', '"+y', { noremap = true  })
-- vim.keymap.set('v', '<D-c>', '"+y', { noremap = true })

-- vim.keymap.set("n", "<D-b>", function()
--   print("Command + B pressed")
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<D-c>", function()
--   print("Command + c pressed")
-- end, { noremap = true, silent = true })
--

-- More information under https://lazy.folke.io/spec
-- own configuratio
-- ensure common config of cmd key
vim.keymap.set("v", "<D-c>", '"+y', { noremap = true, silent = true })

-- In normal mode, use Ctrl + Tab to switch to the next buffer
vim.api.nvim_set_keymap('n', 'bn', ':bnext<CR>', { noremap = true, silent = true })
-- And Ctrl + Shift + Tab to switch to the previous buffer
vim.api.nvim_set_keymap('n', 'bp', ':bprev<CR>', { noremap = true, silent = true })
-- show list of all buffers
vim.keymap.set('n', 'bl', require('telescope.builtin').buffers, { noremap = true, silent = true })


-- Map <leader>y to toggle spell checking for nvim
vim.keymap.set("n", "<leader>y", ":set spell!<CR>", { desc = "Toggle spell check" })


