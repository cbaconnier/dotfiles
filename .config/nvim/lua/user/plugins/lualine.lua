local separator = { '"▏"', color = 'StatusLineNonText' }

require('lualine').setup({
    options = {
      section_separators = '',
      component_separators = '',
      globalstatus = true,
      theme = {
        normal = {
          a = 'StatusLine',
          b = 'StatusLine',
          c = 'StatusLine',
        },
      },
    },
    sections = {
      lualine_a = {
        'mode',
        separator,
      },
      lualine_b = {
        'branch',
        'diff',
        separator,
        '"🖧  " .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
        { 'diagnostics', sources = { 'nvim_diagnostic' } },
        separator,
      },
      lualine_c = {
        'filename',
        require('lsp-progress').progress,
      },
      lualine_x = {
        'filetype',
        'encoding',
        'fileformat',
      },
      lualine_y = {
        separator,
        '(vim.bo.expandtab and "␠ " or "⇥ ") .. " " .. vim.bo.shiftwidth',
        separator,
      },
      lualine_z = {
        'location',
        'progress',
      },
    },
  })

-- listen lsp-progress event and refresh lualine
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = "lualine_augroup",
  pattern = "LspProgressStatusUpdated",
  callback = require("lualine").refresh,
})
