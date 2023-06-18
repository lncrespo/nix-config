local function border(hl_name)
    return {
        { '┌', hl_name },
        { '─', hl_name },
        { '┐', hl_name },
        { '│', hl_name },
        { '┘', hl_name },
        { '─', hl_name },
        { '└', hl_name },
        { '│', hl_name },
    }
end

local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item()),
      ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item()),
    },
    sources = {
      { name = 'nvim_lsp' },

      -- For vsnip user.
      { name = 'vsnip' },

      -- For luasnip user.
      -- { name = 'luasnip' },

      -- For ultisnips user.
      -- { name = 'ultisnips' },

      { name = 'buffer' },
      { name = 'path' },
      { name = 'nvim_lua' },
      { name = 'calc' },
      { name = 'orgmode' }
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })

          if strings[1] ~= nil then
            kind.kind = " " .. strings[1] .. " "
          end

          if strings[2] ~= nil then
            kind.menu = "    (" .. strings[2] .. ")"
          end

          return kind
        end,
    },
    window = {
        completion = {
            border = border("CmpMenuBorder")
        }
    }
  })
