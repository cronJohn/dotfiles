require('mason-tool-installer').setup {
    ensure_installed = {
      'lua-language-server',
      'typescript-language-server',
      'gopls',
      'codelldb',
    },
}