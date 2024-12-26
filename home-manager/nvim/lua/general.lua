local opt = vim.opt

-- Enable syntax
opt.syntax = 'on'

-- Numbers
opt.number = true
opt.relativenumber = true

-- autocmd InsertEnter * :opt.norelativenumber
-- autocmd InsertLeave * :opt.relativenumber

-- Indentation
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.backspace = { 'indent', 'eol', 'start' }

-- Formatting
opt.textwidth = 0
opt.formatoptions = 'cqjo'

-- Swap & Backup
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand('~/.config/nvim/undodir')
opt.undofile = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Misc
opt.belloff = 'all'
opt.errorbells = false
opt.wrap = false
opt.ttimeoutlen = 50
opt.updatetime = 300

-- Visual
opt.showmode = false
opt.list = true
opt.so = 3
opt.siso = 5
opt.listchars = 'trail:·,tab:»-,nbsp:+'
opt.cursorline = true
opt.laststatus = 3
opt.signcolumn = 'yes'

 -- Buffers
opt.hidden = true

-- Graphical
opt.termguicolors = true
opt.fillchars = 'eob: '
opt.colorcolumn = '100'

-- Compe
opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
opt.iskeyword = { '@', '48-57', '_', '192-255', '$' }

-- Autocommands
vim.api.nvim_create_autocmd('InsertEnter', {
    pattern = "*",
    callback = function (opts)
        if vim.bo[opts.buf].filetype ~= 'neo-tree' then
          opt.relativenumber = false
        end
    end,
})
vim.api.nvim_create_autocmd('InsertLeave', {
    pattern = "*",
    callback = function (opts)
        if vim.bo[opts.buf].filetype ~= 'neo-tree' then
          opt.relativenumber = true
        end
    end,
})
vim.cmd[[autocmd FileType markdown setlocal shiftwidth=2]]
vim.cmd[[autocmd FileType c setlocal noexpandtab]]
vim.cmd[[autocmd FileType go setlocal noexpandtab]]
vim.cmd[[autocmd FileType go setlocal colorcolumn=100]]
vim.cmd[[autocmd FileType lua setlocal shiftwidth=2]]
vim.cmd[[autocmd FileType typescript setlocal shiftwidth=2]]

vim.cmd[[autocmd FileType typescript :nmap <leader>cs <cmd>lua vim.lsp.buf.format({ formatting_options = { tabSize = 2, semicolons = 'insert', insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false } })<cr>]]
