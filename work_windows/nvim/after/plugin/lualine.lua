require('lualine').setup {
    options  = {
        theme = 'gruvbox',
        section_separators = '',
        components_separators = '',
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
            {
                'filename',
                path = 1,
                shortening_target = 70
            }
        },
        lualine_x = { 'diagnostics' },
        lualine_y = { 'encoding', 'fileformat', 'filetype' },
        lualine_z = { 'location' }
    },
    tabline  = {
        lualine_a = { 'filename' },
        lualine_x = { 'diff' },
        lualine_y = { 'tabs' },
    }
}
