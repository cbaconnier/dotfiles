set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

syntax on

let mapleader=','                                               "The default leader is \, but a comma is much better.
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab     "Redefine tabs with 4 spaces
set backspace=indent,eol,start                                  "Make backslash behave like every othor editor.

:set mouse=a                                                    "Turn vim into mouse mode

"----------Visuals----------"
set t_Co=256                                                    "Use 256 colors. 

set guioptions-=l                                               "Disable GUI scrollbars
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=e                                               "We don't want Gui tabs
set number                                                      "Activate the line numbers
set showtabline=2                                               "Always show the tabs

"We'll fake a custom left padding for each window.
"hi LineNr guibg=bg
"set foldcolumn=0
"hi foldcolumn guibg=bg

"Get rid of ugly split borders
"hi vertsplit guifg=bg guibg=bg

"Alt key doesn't work on gnome terminal so we have to fix it
"https://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50



"----------Searching----------"

set hlsearch                                                    "Highlight the search
set incsearch                                                   "Incremental search



"----------Split Management----------"

set splitbelow                                                  "Make splits default to below
set splitright                                                  "And to the right. This feels more natural.
"Alias Ctrl-* to  Ctrl-W Crtl-* to switch between splits
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


"----------Mappings----------"

"Make it easy to edit the Vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Remove the highlight.
nmap <Leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle
"Note: Vinegar uses <_>
nmap <C-_> :NERDTreeToggle<cr>

"Bind CtrlP
nmap <A-p> :CtrlP<cr>
nmap <c-R> :CtrlPBufTag<cr>
nmap <A-e> :CtrlPMRUFiles<cr>


"ctags
nmap <Leader>f :tag<space>


"----------Plugins----------"

"/
"/CtrlP
"/
let g:ctrlp_custom_ignore = {
            \ 'dir' : '\.git$\|build$\|node_modules\|dist\|target', 
            \ 'file': '\v\.(exe|dll|lib|jpg|png|mp3|jpeg)$'
            \ }
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"/
"/NERDTree
"/
let NERDTreeHijackNetrw = 0

"/
"/Greplace.vim
"/
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"----------Auto-Commands----------"

"Automatically source the Vimrc file on save.
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

"Notes and tips
" - Press 'zz' to instantly center the line where the cursor is located.
"


