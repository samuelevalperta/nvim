local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#7d83ab ]])

-- change color of vertical split line
vim.cmd([[ hi VertSplit guifg=#2c3043 guibg=#011627 ]])

-- remove split line in statusline
vim.cmd([[ hi NvimTreeStatusLine guifg=#2c3043 guibg=#011627 ]])

-- make root path and folder bold
vim.cmd([[ hi NvimTreeRootFolder gui='bold' guifg=#ae81ff ]])
vim.cmd([[ hi NvimTreeFolderName gui='bold' guifg=#82aaff ]])
vim.cmd([[ hi NvimTreeFolderIcon gui='bold' guifg=#82aaff ]])
vim.cmd([[ hi NvimTreeEmptyFolderName gui='bold' guifg=#82aaff ]])
vim.cmd([[ hi NvimTreeOpenedFolderName gui='bold' guifg=#82aaff ]])

-- keymaps
local keymaps = {
    { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
    { key = "O",                              action = "edit_no_picker" },
    { key = ">",                              action = "cd" },
    { key = "<Tab>",                          action = "preview" },
    { key = "K",                              action = "first_sibling" },
    { key = "J",                              action = "last_sibling" },
    { key = "H",                              action = "toggle_dotfiles" },
    { key = "a",                              action = "create" },
    { key = "d",                              action = "trash" },
    { key = "r",                              action = "rename" },
    { key = "R",                              action = "full_rename" },
    { key = "x",                              action = "cut" },
    { key = "c",                              action = "copy" },
    { key = "p",                              action = "paste" },
    { key = "y",                              action = "copy_name" },
    { key = "Y",                              action = "copy_path" },
    { key = "gy",                             action = "copy_absolute_path" },
    { key = "<",                              action = "dir_up" },
    { key = "s",                              action = "system_open" },
    { key = "f",                              action = "live_filter" },
    { key = "F",                              action = "clear_live_filter" },
    { key = "q",                              action = "close" },
    { key = "W",                              action = "collapse_all" },
    { key = "E",                              action = "expand_all" },
    { key = "/",                              action = "run_file_command" },
    { key = "<C-k>",                          action = "toggle_file_info" },
    { key = "?",                             action = "toggle_help" },
    { key = "d",                                action = "close"}
  }
-- configure nvim-tree
nvimtree.setup({
    remove_keymaps = true,
    view = {
        width = 35,

        mappings = {
            list = keymaps,
        },
    },
	renderer = {
        root_folder_modifier = ":p:gs?.*/??",
        highlight_opened_files = "name",
        -- enable vertical line under folder
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
		    },
		},
        -- disable arrow near folder
        icons = {
            git_placement = 'after',
            glyphs = {
				folder = {
					arrow_closed = "", 
					arrow_open = "", 
				},
			},
        },
    },
	-- disable window_picker for explorer to work well with window splits
	actions = {
		open_file = {
            quit_on_open = true,
			window_picker = {
				enable = false,
			},
		},
	},
    filters = {
        custom = {
            "^.git$"
        }
    }
})
