local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
  filetypes = { 'html', 'twig', 'html.twig', 'html.twig.js.css', 'htmldjango', 'htmldjango.twig', 'handlebars' },
}
