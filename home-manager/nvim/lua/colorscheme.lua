local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.g.gruvbox_material_foreground = 'mix'
vim.cmd('colorscheme apollo')
-- vim.cmd('hi Normal guifg=#ebdbb2 guibg=#212121')
-- vim.cmd('hi EndOfBuffer guifg=#ebdbb2 guibg=#212121')
-- vim.cmd('hi Pmenu guibg=#3c3c3c')
-- vim.cmd('hi CursorLine guibg=#333333')
-- vim.cmd('hi MatchParen gui=bold')
-- vim.cmd('hi DashboardHeader guifg=#5e994e')
-- vim.cmd('hi CursorLineNr gui=bold')
