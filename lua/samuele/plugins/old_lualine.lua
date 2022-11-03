local status, lualine = pcall(require, "lualine")
if not status then
	return
end

lualine.setup({
    options = {
        icons_enabled = false,
        -- theme = "onedark",
        section_separators = '',
        component_separators = '',
        -- globalstatus = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            'branch',
            'diff',
            {'diagnostics',
                symbols = {
                    error = ' ',
                    warn = 'W',
                    info = 'I',
                    hint = 'H'
                },
                colored = false,

            },
        },
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {''}
    },
})
