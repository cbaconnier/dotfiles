local dashboard = require('dashboard')

dashboard.setup({
    theme = 'doom',
    config = {
      header = {
        '',
        '',
        '',
        '      ⢸⣦⡈⠻⣿⣿⣿⣶⣄      ',
        '      ⢸⣿⣿⣦⡈⠻⣿⣿⣿⣷⣄    ',
        '⣀⣀⣀⣀⣀⣀⣼⣿⣿⣿⣿ ⠈⠻⣿⣿⣿⣷⣄  ',
        '⠈⠻⣿⣿⣿⣿⣿⡿⠿⠛⠁   ⠈⠻⢿⣿⣿⣷⣄',
        '',
        '',
      },
      center = {
        { icon = '  ', desc = 'New file', action = 'enew' },
        { icon = '  ', desc = 'Find file               ', key = 'Space + f', action = 'Telescope find_files' },
        { icon = '  ', desc = 'Recent files            ', key = 'Space + h', action = 'Telescope oldfiles' },
        { icon = '  ', desc = 'Find Word               ', key = 'Space + g', action = 'Telescope live_grep' },
      },
      footer = { '' }
    },
    hide = {
      statusline = true,
      tabline = true,
      winbar = true,
    }
  -- init = function()
  --   vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#6272a4' })
  --   vim.api.nvim_set_hl(0, 'DashboardDesc', { fg = '#f8f8f2' })
  --   vim.api.nvim_set_hl(0, 'DashboardIcon', { fg = '#bd93f9' })
  --   vim.api.nvim_set_hl(0, 'DashboardKey', { fg = '#6272a4' })
  --   vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#6272a4' })
  -- end,
  })

vim.cmd([[
  augroup DashboardHighlights
    autocmd ColorScheme * highlight DashboardHeader guifg=#6272a4
    autocmd ColorScheme * highlight DashboardCenter guifg=#f8f8f2
    autocmd ColorScheme * highlight DashboardShortcut guifg=#bd93f9
    autocmd ColorScheme * highlight DashboardFooter guifg=#6272a4
  augroup end
]])
