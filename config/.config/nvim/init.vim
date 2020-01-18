set ambw=single
set backup
set encoding=utf-8
set fileencoding=utf-8
set fillchars+=stl:\ ,stlnc:\
" allow arrows to go back in history
set history=50
set incsearch
set laststatus=2
"disable the mouse for all modes
set mouse-=a
set nomodeline
" numbering lines
set number
" tab completion
set path+=**
" relative numbering of the lines
set rnu
" show ruler in bottom with info, not needed with plugin
" set ruler
set shiftwidth=2
" number of colors
set t_Co=256
set tabstop=2
" display all matching files when we tab complete
set wildmenu
" folding off when opening
set foldmethod=syntax
set nofoldenable
set pastetoggle=<F2>

syntax enable
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
" reset cursor when vim exits: useless?
" autocmd VimLeave * silent !echo -ne "\033]112\007"
" use \003]12;gray\007 for gnome-terminal

" use an orange cursor in insert mode
let &t_SI = "\<Esc>]12;orange\x7"
" use a red cursor otherwise
let &t_EI = "\<Esc>]12;red\x7"
silent !echo -ne "\033]12;red\007"
let g:airline_theme='wombat'
let g:Powerline_symbols = 'fancy'
let g:Powerline_mode_V="V·LINE"
let g:Powerline_mode_cv="V·BLOCK"
let g:Powerline_mode_S="S·LINE"
let g:Powerline_mode_cs="S·BLOCK"

execute pathogen#infect()

set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'
filetype plugin on
let g:Tex_CustomTemplateDirectory = '/root/.config/nvim/ftplugin/latex-suite'

source $HOME/.config/nvim/mappings
