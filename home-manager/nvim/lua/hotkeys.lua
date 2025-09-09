vim.g.mapleader= " "

vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true });
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true });
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true });
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true });

vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree reveal<cr>', { noremap = true });

vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>Lspsaga goto_definition<cr>', { noremap = true });
vim.api.nvim_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<cr>', { noremap = true });
vim.api.nvim_set_keymap('n', '<leader>lf', '<cmd>Lspsaga finder<cr>', { noremap = true });
vim.api.nvim_set_keymap('n', '<leader>lr', '<cmd>Lspsaga rename<cr>', { noremap = true });
vim.api.nvim_set_keymap('n', '<leader>lcs', '<cmd>lua vim.lsp.buf.format({async=true})<cr>', { noremap = true });
vim.api.nvim_set_keymap('n', '<leader>la', '<cmd>Lspsaga code_action<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ltd', '<cmd>Lspsaga goto_type_definition<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lwd', '<cmd>Lspsaga show_workspace_diagnostics<cr>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true });
vim.api.nvim_set_keymap('n', '<leader>fa', '<cmd>Telescope find_files find_command=fd,-H,-I<cr>', { noremap = true });
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>Telescope live_grep<cr>', { noremap = true });
