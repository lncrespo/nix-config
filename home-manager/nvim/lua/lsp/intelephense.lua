local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.intelephense.setup{
    cmd = { "intelephense", "--stdio" },
    on_attach = function(client, bufnr)
        require'lsp_signature'.on_attach(signature_config)
    end,
    capabilities = capabilities,
    filetypes = { "php" },
    root_dir = function()
        return vim.fn.getcwd()
    end,
    settings = {
        intelephense = {
            completion = {
                maxItems = 200
            },
            phpdoc = {
                classTemplate = {
                    tags = {
                        "Class ${1:$SYMBOL_TYPE}",
                        "\n@package ${1:$SYMBOL_NAMESPACE}"
                    }
                },
                functionTemplate = {
                    tags = {
                        "@param ${1:$SYMBOL_TYPE} $SYMBOL_NAME",
                        "@return ${1:$SYMBOL_TYPE}",
                        "@throws ${1:$SYMBOL_NAME}"
                    }
                },
                propertyTemplate = {
                    tags = {
                        "@var ${1:$SYMBOL_TYPE}\n"
                    }
                }
            },
            files = {
                exclude = {}
            },
            references = {
                exclude = {}
            }
        }
    }
}
