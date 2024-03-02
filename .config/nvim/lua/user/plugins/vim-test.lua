vim.keymap.set('n', '<Leader>tn', ':TestNearest<CR>')
vim.keymap.set('n', '<Leader>tf', ':TestFile<CR>')
vim.keymap.set('n', '<Leader>ts', ':TestSuite<CR>')
vim.keymap.set('n', '<Leader>tl', ':TestLast<CR>')
vim.keymap.set('n', '<Leader>tv', ':TestVisit<CR>')
vim.keymap.set('n', '<Leader>ta', ':call FloatermStrategy("php artisan test -p --colors=always")<CR>')

vim.cmd([[
  let test#php#phpunit#executable = 'php artisan test -p'
  let test#php#phpunit#options = '--colors=always'
  let test#php#pest#options = '--colors=always'

  function! FloatermStrategy(cmd)
    execute 'silent FloatermKill'
    let cmd = substitute(a:cmd, '--colors ', '', 'g')
    execute 'FloatermNew! '.cmd.' | less -X'
  endfunction

  let g:test#custom_strategies = {'floaterm': function('FloatermStrategy')}
  let g:test#strategy = 'floaterm'
]])
