-- Setup Mason to automatically install LSP servers
require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- vim.cmd('set verbosefile=/tmp/neovim.log')
-- vim.cmd('set verbose=15')
-- PHP
require('lspconfig').intelephense.setup({ capabilities = capabilities })
-- local phpactor_path = '/home/clement/.local/share/phpactor/bin/phpactor'
-- require('lspconfig').phpactor.setup{
--     cmd = { phpactor_path, 'language-server' },
--     capabilities = capabilities,
--     on_attach = on_attach,
--     init_options = {
--         ["language_server_phpstan.enabled"] = true,
--         ["language_server_psalm.enabled"] = false,
--     }
-- }

-- Typescript
require('lspconfig').tsserver.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
})

-- Tailwind
require('lspconfig').tailwindcss.setup({ capabilities = capabilities })

-- JSON
require('lspconfig').jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})


-- Rust
require('lspconfig').rust_analyzer.setup({
    capabilities = capabilities,
    settings = {
      ['rust-analyzer'] = {
        check = { command = "clippy";},
        diagnostics = { enable = true; },
      }
    }
  })

-- null-ls
local null_ls = require('null-ls')
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.phpstan.with({
      temp_dir = "/tmp"
      }),
    null_ls.builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
    null_ls.builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    null_ls.builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
     null_ls.builtins.formatting.pint.with({
      condition = function(utils)
        return utils.root_has_file({ 'vendor/bin/pint' })
      end,
    }),
    null_ls.builtins.formatting.prettier.with({
          extra_filetypes = {"blade"},
          condition = function(utils)
            return utils.root_has_file({ '.prettierrc', '.prettierrc.json', '.prettierrc.yml', '.prettierrc.js', 'prettier.config.js' })
          end,
        }),
  },
  on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
            end,
          })
        end
      end,
})

-- Laravel
-- local lspconfig = require'lspconfig'
-- local configs = require 'lspconfig.configs'
-- local laravel_dev_tools_path = '/home/clement/.local/share/laravel-dev-tools/laravel-dev-tools'
-- -- Configure it
-- configs.blade = {
--   default_config = {
--     -- Path to the executable: laravel-dev-generators
--     cmd = { laravel_dev_tools_path, "lsp" },
--     filetypes = {'blade'};
--     root_dir = function(fname)
--       return lspconfig.util.find_git_ancestor(fname)
--     end;
--     settings = {};
--   };
-- }
-- -- Set it up
-- lspconfig.blade.setup{
--   -- Capabilities is specific to my setup.
--   capabilities = capabilities
-- }


require('mason-null-ls').setup({ automatic_installation = true })


-- Keymaps
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>')
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
vim.keymap.set('n', '<Leader>lr', ':LspRestart<CR>', { silent = true })
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format({ timeout_ms = 5000 }) end, {})

