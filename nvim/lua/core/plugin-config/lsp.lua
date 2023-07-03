-- Define keybindings for all LSP servers
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    -- Create your keybindings here...
  end
})

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "rust_analyzer",
    "lua_ls",
    "tsserver",
  }
})

require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local get_servers = require('mason-lspconfig').get_installed_servers

-- Apply lsp_capabilities to all LSP servers
for _, server_name in ipairs(get_servers()) do
  lspconfig[server_name].setup({
    capabilities = lsp_capabilities,
  })
end

-- Configure each LSP server

-- Lua
require("lspconfig").lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }, -- ignore 'unused vim' errors when working with config files
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.stdpath "config" .. "/lua"] = true,
                },
                checkThirdParty = false, -- prevents "configure your work environment as `LÖVE`"
            },
            completion = {
                callSnippet = "Replace"
            },
        },
    }
}
