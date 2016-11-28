"""""""""""""""""""""""""""""""""""""""
" Vundle

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
Plugin 'vim-latex/vim-latex'
Plugin 'vhdirk/vim-cmake'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" End of Vundle config.
"""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
"
" Global config. (https://jonasdevlieghere.com/a-better-youcompleteme-config/)
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" Allow .ycm_extra_config.py to load.
"let g:ycm_extra_conf_globlist = ['~/Source/*']

" Only allow these files for ycm.
" let g:ycm_filetype_whitelist = { 'cpp': 1 }

" Disallow for ycm.
let g:ycm_filetype_blacklist = { 'latex': 1 }

" Call the semantic "most sensible" GoTo.
map <F2> :YcmCompleter GoTo<CR>

" Quick access to FixIt.
map <F4> :YcmCompleter FixIt<CR>

"""""""""""""""""""""""""""""""""""""""
" Airline
set laststatus=2
let g:airline_theme = 'light'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" bufferline things
let g:bufferline_echo = 0

"""""""""""""""""""""""""""""""""""""""
" Editor settings.

"ruler is good
set ruler

"shiftwidth
set sw=4

"smarttab (inserts shiftwidth spaces)
set sta

"expandtab (tab is space)
set et

"ensures grep generates a file name (vim-latex likes this)
set grepprg=grep\ -nH\ $*

"turn on syntax automatically
syntax on

"vim-latex: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex'
let g:tex_flavor='latex'
