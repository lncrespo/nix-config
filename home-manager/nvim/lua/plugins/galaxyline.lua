local gl = require("galaxyline")
local gls = gl.section
local condition = require("galaxyline.condition")

lsp_status.register_progress()

gl.short_line_list = {" "}

local colors = {
    white = "#bbbbbb",
    darker_black = "#1b1f27",
    black = "#1e222a", --  nvim bg
    black2 = "#252931",
    one_bg = "#282c34", -- real bg of onedark
    one_bg2 = "#353b45",
    one_bg3 = "#30343c",
    grey = "#42464e",
    grey_fg = "#565c64",
    grey_fg2 = "#6f737b",
    light_grey = "#6f737b",
    red = "#d47d85",
    baby_pink = "#DE8C92",
    pink = "#ff75a0",
    line = "#2a2e36", -- for lines like vertsplit
    green = "#A3BE8C",
    vibrant_green = "#7eca9c",
    nord_blue = "#81A1C1",
    blue = "#61afef",
    yellow = "#e7c787",
    sun = "#EBCB8B",
    purple = "#b4bbc8",
    dark_purple = "#c882e7",
    teal = "#519ABA",
    orange = "#fca2aa",
    cyan = "#a3b8ef",
    statusline_bg = "#222222",
    lightbg = "#352f2a",
    lightbg2 = "#1e222a"
}

gls.left[2] = {
    left_spacing = {
        provider = function()
            return "  "
        end,
        highlight = { colors.white, colors.lightbg }
    }
}

gls.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = condition.buffer_not_empty,
        highlight = {colors.white, colors.lightbg}
    }
}

gls.left[4] = {
    FileName = {
        provider = {"FileName"},
        condition = condition.buffer_not_empty,
        highlight = {colors.white, colors.lightbg},
        separator = " ▎",
        separator_highlight = {colors.statusline_bg, colors.lightbg}
    }
}

gls.left[5] = {
    current_dir = {
        provider = function()
            local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return "  " .. dir_name .. "  "
        end,
        highlight = {colors.white, colors.lightbg}
    }
}

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 30 then
        return true
    end
    return false
end

gls.left[6] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.white, colors.statusline_bg}
    }
}

gls.left[7] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = "   ",
        highlight = {colors.grey_fg2, colors.statusline_bg}
    }
}

gls.left[8] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.grey_fg2, colors.statusline_bg}
    }
}

gls.left[9] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.red, colors.statusline_bg}
    }
}

gls.left[10] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {colors.yellow, colors.statusline_bg}
    }
}

gls.right[0] = {
    lsp_status = {
        provider = function()
            local clients = vim.lsp.get_active_clients()

            if next(clients) ~= nil then
                return lsp_status.status()
            else
                return ""
            end
        end
    }
}

gls.right[1] = {
    FileEncode = {
        provider = 'FileEncode',
        highlight = {colors.white, colors.lightbg},
        separator = " ",
        separator_highlight = {colors.statusline_bg, colors.lightbg}
    }
}

gls.right[2] = {
    FileFormat = {
        provider = 'FileFormat',
        highlight = {colors.white, colors.lightbg},
        separator = '  ▎ ',
        separator_highlight = {colors.statusline_bg, colors.lightbg}
    }
}

gls.right[3] = {
    file_type = {
        provider = 'FileTypeName',
        highlight = {colors.white, colors.lightbg},
        separator_highlight = {colors.grey_fg2, colors.lightbg},
        separator = '  ▎ ',
        separator_highlight = {colors.statusline_bg, colors.lightbg}
    }
}

gls.right[10] = {
    ViMode = {
        provider = function()
            local alias = {
                n = "Normal",
                i = "Insert",
                c = "Command",
                V = "V-Line",
                [""] = "Visual Block",
                v = "Visual",
                R = "Replace"
            }
            local current_Mode = alias[vim.fn.mode()]

            if current_Mode == nil then
                return "  Terminal "
            else
                return " " .. current_Mode .. " "
            end
        end,
        highlight = {colors.white, colors.lightbg},
        separator = '  ▎ ',
        separator_highlight = {colors.statusline_bg, colors.lightbg}
    }
}

gls.right[12] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = ' ▎ ',
        separator_highlight = {colors.statusline_bg, colors.lightbg},
        highlight = {colors.white, colors.lightbg}
    }
}
