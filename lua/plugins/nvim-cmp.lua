return {
  "hrsh7th/nvim-cmp",
  -- event = "InsertEnter", -- Lazy load on insert mode
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "neovim/nvim-lspconfig"
  },
  priority = 100,
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- Use LuaSnip for snippets
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirms selection
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },  -- Fixed missing comma
        { name = "path" },
      }),
      performance = {
        debounce = 0, -- default is 60ms
        throttle = 0, -- default is 30ms
      },
      completion = { keyword_length = 5 }, -- when inserting text into buffer
    })

    -- other parts to call in config func
    -- `/` command-line completion
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- `:` command-line completion
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })

    -- Enable LSP capabilities for better completion
   -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
    -- require("lspconfig").lua_ls.setup({
    --   capabilities = capabilities,
    -- })
   -- require("lspconfig").texlab.setup({
    --  capabilities = capabilities,
    -- })
  end,
}

