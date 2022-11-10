local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local colors = {
    bg = '#011627',
	fg = '#c3ccdc'
}

local config = {
  options = {
    icons_enabled = false,
    theme = {
    	inactive = {
                a = { fg = colors.fg, bg = colors.bg },
                b = { fg = colors.fg, bg = colors.bg },
                c = { fg = colors.fg, bg = colors.bg },
            },
		visual = {
                a = { fg = colors.fg, bg = colors.bg},
                b = { fg = colors.fg, bg = colors.bg },
                c = { fg = colors.fg, bg = colors.bg },
            },
		replace = {
                a = { fg = colors.fg, bg = colors.bg},
                b = { fg = colors.fg, bg = colors.bg },
                c = { fg = colors.fg, bg = colors.bg },
            },
		normal = {
                a = { fg = colors.fg, bg = colors.bg},
                b = { fg = colors.fg, bg = colors.bg },
                c = { fg = colors.fg, bg = colors.bg },
            },
		insert = {
                a = { fg = colors.fg, bg = colors.bg },
                b = { fg = colors.fg, bg = colors.bg },
                c = { fg = colors.fg, bg = colors.bg },
            },
		command = {
                a = { fg = colors.fg, bg = colors.bg},
                b = { fg = colors.fg, bg = colors.bg },
                c = { fg = colors.fg, bg = colors.bg },
            },
    },
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
        statusline = {
            'packer',
        },
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {
        {'mode',
            padding = {
                left = 1,
                right = 0,
            },
        },
        'filename',
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {
        {'location',
            padding = {
                left = 0,
                right = 0,
            },
        },
        {'progress',
            padding = {
                left = 1,
                right = 0
            },
        },
    },
    lualine_y = {},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {'nvim-tree'}
}

lualine.setup(config)
