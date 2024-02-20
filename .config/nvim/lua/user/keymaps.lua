-- Space is my leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' ' 

-- Map "jk" to exit insert mode and return to normal mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set('n', 'k', "v:count == 0? 'gk' : 'k'", { expr = true})
vim.keymap.set('n', 'j', "v:count == 0? 'gj' : 'j'", { expr = true})

-- Reselect visual selection after indenting.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection.
vim.keymap.set('v', 'y', 'myy`y')

-- Disable annoying command line typo.
vim.keymap.set('n', 'q:', ':')

-- Past replace visual selection without copying it.
vim.keymap.set('v', 'p', '"_dP')

-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set('i', ';;', '<Esc>A;')
vim.keymap.set('i', ',,', '<Esc>A,')

-- Quickly clear search highlighting.
vim.keymap.set('n', '<Leader>k', ':nohlsearch<CR>')


-- Open the current file in the default program.
vim.keymap.set('n', '<Leader>x', ':!xdg-open %<CR><CR>')

-- Move lines up and down.
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', '<A-j>', ':move .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':move .-2<CR>==')
vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")


-- Map é and à directly for vim-unimpaired
vim.api.nvim_set_keymap('n', 'é', '[', { noremap = false })
vim.api.nvim_set_keymap('n', 'à', ']', { noremap = false })
vim.api.nvim_set_keymap('o', 'é', '[', { noremap = false })
vim.api.nvim_set_keymap('o', 'à', ']', { noremap = false })
vim.api.nvim_set_keymap('x', 'é', '[', { noremap = false })
vim.api.nvim_set_keymap('x', 'à', ']', { noremap = false })
