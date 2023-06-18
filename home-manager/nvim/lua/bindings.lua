vim.g.mapleader= " "

-- Window switching
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true });
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true });
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true });
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true });

-- LSP
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua require\'telescope.builtin\'.lsp_definitions()<cr>', { noremap = true });
vim.api.nvim_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover({ focusable=false })<cr>', { noremap = true });
vim.api.nvim_set_keymap('n', '<leader>re', '<cmd>lua require\'telescope.builtin\'.lsp_references()<cr>', { noremap = true });
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', { noremap = true });
vim.api.nvim_set_keymap('n', '<leader>cs', '<cmd>lua vim.lsp.buf.format({async=true})<cr>', { noremap = true });
vim.api.nvim_set_keymap('n', '<leader>i', '<cmd>lua require\'telescope.builtin\'.lsp_implementations()<cr>', { noremap = true });
vim.api.nvim_set_keymap('n', '<leader>a', ':lua vim.lsp.buf.code_action()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', ',er', ':lua require\'telescope.builtin\'.diagnostics({bufnr=0})<cr>', { noremap = true })

-- File tree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<cr>', { noremap = true });

-- Symbol outline
vim.api.nvim_set_keymap('n', '<leader>o', '<cmd>SymbolsOutline<cr>', { noremap = true });

-- Bufferline navigation
vim.api.nvim_set_keymap('n', '<leader>w', ':bw<cr>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<cr>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<cr>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<cr>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<cr>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<cr>', { noremap = true, silent = true });

-- Compe (Completion)
-- vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { silent = true, expr = true });
-- vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm(\'<cr>\')', { noremap = true, silent = true, expr = true });

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Telescope find_files<cr>', { noremap = true });
vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>Telescope find_files find_command=fd,-H,-I<cr>', { noremap = true });
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>Telescope live_grep<cr>', { noremap = true });
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>lua require\'telescope\'.extensions.file_browser.file_browser({ respect_gitignore = false })<cr>', { noremap = true });
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua require\'telescope\'.extensions.file_browser.file_browser({ cwd = require\'telescope.utils\'.buffer_dir(), respect_gitignore = false })<cr>', { noremap = true });
vim.api.nvim_set_keymap('n', '<leader>m', '<cmd>Telescope media_files<cr>', { noremap = true });

vim.api.nvim_set_keymap('n', ',bl', '<cmd>Gitsigns toggle_current_line_blame<cr>', { noremap = true });

vim.api.nvim_set_keymap('n', '<leader>o', '<cmd>Telescope commands<cr>', { noremap = true });
