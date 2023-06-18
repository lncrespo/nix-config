local colors = {
  red = '#ca1243',
  grey = '#f5f5f5',
  black = '#383a42',
  white = '#ffffff',
  transparent = '#212121',
  light_green = '#83a598',
  orange = '#fe8019',
  green = '#8ec07c',
  yellow = '#c9b04f',
  cyan = '#489FC1',
  light_grey = '#383838',
  light_grey_a = '#484848',
  light_grey_b = '#686868',
}

local theme = {
  normal = {
    a = { fg = colors.white, bg = colors.red, gui = 'bold' },
    b = { fg = colors.black,  bg = colors.grey, gui = 'bold' },
    c = { fg = colors.light_grey, bg = colors.transparent, gui = 'bold' },
    z = { fg = colors.white, bg = colors.black, gui = 'bold' },
  },
  insert = { a = { fg = colors.black, bg = colors.yellow, gui = 'bold' } },
  visual = { a = { fg = colors.white, bg = colors.cyan, gui = 'bold' } },
  replace = { a = { fg = colors.black, bg = colors.green, gui = 'bold' } },
}

local empty = require('lualine.component'):extend()

function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.transparent } })
    end

    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end

      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end

  local last_search = vim.fn.getreg('/')

  if not last_search or last_search == '' then
    return ''
  end

  local searchcount = vim.fn.searchcount { maxcount = 9999 }

  return last_search .. ' (' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

require'lualine'.setup{
  options = {
    theme = theme,
    component_separators = '',
    globalstatus = true
  },
  sections = process_sections {
    lualine_a = { 'mode' },
    lualine_b = {
      { 'branch', color = { bg = colors.light_grey_a, fg = colors.white } },
      { 'filename', file_status = false, path = 3, color = { bg = colors.light_grey, fg = colors.white, gui = 'bold' } },
      {
        'diagnostics',
        source = { 'nvim_lsp' },
        sections = { 'error' },
        diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
      },
      {
        'diagnostics',
        source = { 'nvim_lsp' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
      },
      {
        'diagnostics',
        source = { 'nvim_lsp' },
        sections = { 'hint' },
        diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
      },
      { modified, color = { fg = colors.blk, bg = colors.yellow } },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { { search_result, color = { bg = colors.light_grey_b, fg = colors.white }}, { 'filetype', color = { bg = colors.light_grey_b, fg = colors.white }} },
    lualine_z = { '%l:%c', '%p%% / %L' },
  },
  inactive_sections = {
    lualine_c = { '%f %y %m' },
    lualine_x = {},
  },
}
