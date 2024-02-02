local rt = require("rust-tools")
local mason_registry = require("mason-registry")

local map = require("keytex.keybindings").create_keybinding

local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

rt.setup({
    dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    server = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(_, bufnr)
            map("n", "<leader>sa", rt.hover_actions.hover_actions, { desc = "Rust hover actions", buffer = bufnr })
            map("n", "<leader>sr", rt.code_action_group.code_action_group, { desc = "Rust code group actions", buffer = bufnr })
        end,
    },
    tools = {
        hover_actions = {
            auto_focus = true,
        },
    },
})
