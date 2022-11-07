local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- lualine.setup({
--     options = {
--         theme = 'nightfly',
--     },
-- })

-- local colors = require('nighfly.colors').setup()

local colors = {
  -- StatusLine background color.
  bg = '#2c3043',

  -- Mode colors.
  blue = '#82aaff',
  green = '#a1cd5e',
  magenta = '#ae81ff',
  yellow = '#ecc48d',
  red = '#ff5874',
  cyan = '#7fdbca',

  -- Mode text color.
  blue2= '#092236', -- blu scuro

  -- StatusLineNC foreground.
  black = '#a1aab8', -- nero

  -- Normal text color.
  fg = '#c3ccdc',}

local config = {
    options = {
        icons_enabled = false,
        section_separators = '',
        component_separators = '',
        normal = { c = { fg = colors.fg, bg = colors.red } },
        inactive = { c = { fg = colors.fg, bg = colors.blue} },
        globalstatus = false,
        disabled_filetypes = { 'packer', 'NvimTree' },

    },
        sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_v = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand '%:t') ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand '%:p:h'
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

local mode_color = {
	n = colors.green,
	i = colors.blue,
	v = colors.magenta,
	V = colors.magenta,
    ['^V'] = colors.magenta, -- not wornking, need a fix
	c = colors.yellow,
	no = colors.red,
	s = colors.yellow,
	S = colors.yellow,
	ic = colors.yellow,
	R = colors.magenta,
	Rv = colors.magenta,
	cv = colors.red,
	ce = colors.red,
	r = colors.cyan,
	rm = colors.cyan,
	['r?'] = colors.cyan,
	['!'] = colors.red,
	t = colors.red,
}

ins_left {
  function()
	  vim.api.nvim_command('hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.bg)
    -- return '▊'
    return ''
  end,
  color = 'LualineMode',
  padding = { left = 1, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  'mode',
  color = function()
    -- auto change color according to neovims mode and set bold
        return { fg = mode_color[vim.fn.mode()], gui = 'bold' }
  end,
  padding = {left = 0, right = 1}
}

ins_left {
  'diagnostics',
  sections = { 'error', 'warn', 'info'},
  symbols = { error = ' ', warn = ' ', hint = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
  padding = {left = 1, right = 1}
}

ins_left {
    'filename',
    file_status = false,
    path = 1,
    color = { fg = colors.fg},
    padding = {left = 1, right = 1}
}

ins_left {
  -- Lsp server name .
  function()
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return '' end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return ' :' .. client.name
      end
    end
  end,
  }

ins_right{
    function ()
        return ''
    end,
    color = {fg = colors.fg},
    padding = {left = 1, right = 0},
    cond = conditions.check_git_workspace,
}

ins_right {
  'branch',
  color = { fg = colors.fg, gui = '' },
  padding = {left = 1, right = 0}
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  -- symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  symbols = { added = '+', modified = '~', removed = '-' },
  diff_color = {
    added = { fg = colors.fg}, -- green, orange, red
    modified = { fg = colors.fg},
    removed = { fg = colors.fg},
  },
  cond = conditions.hide_in_width,
  padding = {left = 1, right = 1}
}

ins_right {
    'location',
    color = {fg = colors.blue},
    paddind = {right = 0}
}

ins_right {
    'progress',
    padding = {left = 0, right = 1}
}

lualine.setup(config)
