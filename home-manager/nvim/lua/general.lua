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
opt.mouse = 'a'

-- Visual
opt.showmode = false
opt.list = true
opt.so = 3
opt.siso = 5
opt.listchars = 'trail:·,tab:»-,nbsp:+'
opt.cursorline = true

 -- Buffers
opt.hidden = true

-- Graphical
opt.termguicolors = true
opt.fillchars = 'eob: '
opt.colorcolumn = '100'

-- Compe
opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
opt.iskeyword = { '@', '48-57', '_', '192-255', '$' }
