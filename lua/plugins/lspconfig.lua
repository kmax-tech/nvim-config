return {

    {
        "williamboman/mason.nvim",
    	opts = {   
	ui = {  -- better visualization
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
    }  
    }
    }
},
    {
        "williamboman/mason-lspconfig.nvim",
          dependencies = { "williamboman/mason.nvim" }, -- Ensures Mason is loaded first

	opts = {}    
},
    {
        "neovim/nvim-lspconfig",
          dependencies = { "williamboman/mason-lspconfig.nvim" }, -- Ensures Mason is loaded first
	config = function() 

    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- lspconfig.texlab.setup({
--   capabilities = capabilities,  -- Add capabilities here
-- })	

end,
    },
}
