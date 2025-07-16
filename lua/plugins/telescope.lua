return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = "which_key"
          }
        }
      },
      pickers = {
        -- Your pickers config here
      },
      extensions = {
        -- Your extensions config here
      }
    },
    config = function(_, opts)
      require("telescope").setup(opts)

      local builtin = require("telescope.builtin")
      local utils = require("telescope.utils")

      vim.keymap.set("n", "<leader>ff", function()
        builtin.find_files({ cwd = utils.buffer_dir() })
      end, { desc = "Telescope: Find files (buffer dir)" })

      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope: Live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: List buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope: Help tags' })
    end
  },

  {
    'nvim-telescope/telescope-project.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" }
  }
}
