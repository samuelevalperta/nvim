local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#7D83AB ]])

-- change color of vertical split line
vim.cmd([[ hi VertSplit guifg = '#2c3043' guibg = '#011627' ]])

-- remove split line in statusline
vim.cmd([[ hi NvimTreeStatusLine guifg = '#2c3043' guibg = '#011627' ]])

-- configure nvim-tree
nvimtree.setup({
    view = {

    },
	renderer = {
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
          glyphs = {
				folder = {
					-- arrow_closed = "", 
					-- arrow_open = "", 
				},
			},
        },
    },
	-- disable window_picker for explorer to work well with window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
