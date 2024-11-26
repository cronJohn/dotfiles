local map = require("keytex.keybindings").create_keybinding

-- Define keybindings for all LSP servers
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(_)
    end,

})

map("n", "<leader>tn", vim.lsp.buf.declaration,                                      {desc = "LSP declaration"})
map("n", "<leader>te", vim.lsp.buf.definition,                                       {desc = "LSP definition"})
map("n", "<leader>ti", vim.lsp.buf.implementation,                                   {desc = "LSP implementation"})
map("n", "<leader>tr", vim.lsp.buf.references,                                       {desc = "LSP references"})
map("n", "K", vim.lsp.buf.hover,                                                     {desc = "LSP hover"})
map("n", "<leader>th", vim.lsp.buf.type_definition,                                  {desc = "LSP type definition"})
map("n", "<leader>ts", vim.lsp.buf.rename,                                           {desc = "LSP rename"})
map("i", "<C-a>", function() vim.lsp.buf.signature_help() end,                       {desc = "LSP signature help"})

map("n", "<leader>ty", vim.lsp.buf.add_workspace_folder,                             {desc = "LSP add workspace folder"})
map("n", "<leader>tu", vim.lsp.buf.remove_workspace_folder,                          {desc = "LSP remove workspace folder"})
map("n", "<leader>tl", function() P(vim.lsp.buf.list_workspace_folders()) end,       {desc = "LSP list workspace folders"})
map("n", "<leader>tm", function() vim.lsp.buf.workspace_symbol() end,                {desc = "LSP search workspace symbol"})

map({ "n", "v" }, "<leader>ta", vim.lsp.buf.code_action,                             {desc = "LSP code action"})
map("n", "<leader>tf", function() vim.lsp.buf.format { async = true } end,           {desc = "LSP format file"})
map("n", "<leader>to", function() vim.diagnostic.open_float() end,                   {desc = "LSP open diagnostic float"})

require("mason").setup()

require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local get_servers = require('mason-lspconfig').get_installed_servers
local util = require("lspconfig/util")

-- Change gutter icons
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Apply lsp_capabilities to all LSP servers
for _, server_name in ipairs(get_servers()) do
  lspconfig[server_name].setup({
    capabilities = lsp_capabilities,
  })
end

-- Configure each LSP server
-- Lua
lspconfig.lua_ls.setup {
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

-- Go
lspconfig.gopls.setup {
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
      gopls = {
          buildFlags = { "-tags=dev,prod" },
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
              unusedparams = true,
          },
      },
  },
}

-- Zig
lspconfig.zls.setup{
cmd = { '/opt/homebrew/bin/zls' },
  settings = {
    zls = {
      zig_exe_path = '/opt/homebrew/bin/zig',
    }
  }
}
