local tree_cb = require 'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1
}

vim.g.nvim_tree_highlight_opened_files = 1

vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌"
    },
    folder = {
        default = "",
        open = "",
        symlink = "",
        empty = "",
        empty_open = "",
        symlink_open = ""
    }
}

require'nvim-tree'.setup{
    disable_netrw = true,
    auto_close = true,
    diagnostics = {
        enable = true
    },

    view = {
        width = 50,
        mappings = {
            list = {
                { key = {"l"}, cb = tree_cb("edit") },
                { key = {"h"}, cb = tree_cb("close_node") }
            }
        }
    }
}
