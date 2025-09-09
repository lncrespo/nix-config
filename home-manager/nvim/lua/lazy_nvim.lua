local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'Mofiqul/vscode.nvim',
    priority = 999,
    lazy = false,
    config = function()
      -- vim.cmd[[ colorscheme vscode ]]
      -- vim.cmd[[ hi Normal guibg=#1e1e1e ]]
      -- vim.cmd[[ hi NeoTreeNormal guibg=#1a1a1a ]]
      -- vim.cmd[[ hi NeoTreeNormalNC guibg=#1a1a1a ]]
      -- vim.cmd[[ hi NeoTreeCursorLine guibg=#454545 ]]

      -- vim.cmd[[ hi @keyword guifg=#d8a0df ]]
      -- vim.cmd[[ hi @keyword.return guifg=#d8a0df ]]
      -- vim.cmd[[ hi @keyword.conditional guifg=#d8a0df ]]
      -- vim.cmd[[ hi @keyword.exception guifg=#d8a0df ]]
      -- vim.cmd[[ hi @keyword.repeat guifg=#d8a0df ]]
      -- vim.cmd[[ hi @keyword.import guifg=#d8a0df ]]
      -- vim.cmd[[ hi @type guifg=#4ec9b0 ]]
      -- vim.cmd[[ hi @function.macro guifg=#beb7ff ]]
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'sainnhe/gruvbox-material',
    priority = 999,
    lazy = false,
    config = function()
      vim.g.gruvbox_material_background = 'hard'
      -- local hour = os.date('*t').hour
      -- vim.o.background = 'light'
      -- if hour > 19 or hour < 9 then
      --   vim.o.background = 'dark'
      -- end

      vim.cmd[[ colorscheme gruvbox-material ]]
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require'neo-tree'.setup{
        buffers = {
          follow_current_file = {
            enabled = true
          },
        },
      }
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require'nvim-treesitter.configs'.setup{
          highlight = {
              enable = true
          },
          indent = {
              enable = true
          },
          ensure_installed = {
              "bash",
              "c",
              "comment",
              "css",
              "dockerfile",
              "git_config",
              "git_rebase",
              "gitattributes",
              "gitcommit",
              "gitignore",
              "go",
              "graphql",
              "groovy",
              "html",
              "javascript",
              "jsdoc",
              "json",
              "json5",
              "jsonc",
              "lua",
              "make",
              "markdown",
              "markdown_inline",
              "nix",
              "php",
              "query",
              "rust",
              "sql",
              "toml",
              "typescript",
              "terraform",
              "vim",
              "vimdoc",
              "vue",
              "yaml",
          }
      }
    end
  },
  'nvim-treesitter/nvim-treesitter-context',

  'neovim/nvim-lspconfig',

  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
    end,
  },

  {
   'nvim-telescope/telescope-fzf-native.nvim',
   build = 'make'
  },
  {
   'nvim-telescope/telescope.nvim',
   dependencies = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
   config = function()
     require'telescope'.setup{}
     require'telescope'.load_extension('fzf')
   end
  },
  {
   'j-hui/fidget.nvim',
   config = function()
     require("fidget").setup {
     }
   end,
  },

  'lewis6991/gitsigns.nvim',
  'RRethy/vim-illuminate',

  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({})
    end
  },

  'hrsh7th/vim-vsnip',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-calc',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lua',
  'onsails/lspkind-nvim',
  'ray-x/lsp_signature.nvim',

  {
    'hrsh7th/nvim-cmp',
    config = function()
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
          preselect = cmp.PreselectMode.None,
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
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
            ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item()),
            ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item()),
          },
          sources = {
          { name = 'nvim_lsp' },
              { name = "codeium" },
              { name = 'vsnip' },
              { name = 'calc' },
              { name = 'buffer' },
              { name = 'path' },
              { name = 'nvim_lua' },
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
    end
  },
})
