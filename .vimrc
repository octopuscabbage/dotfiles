set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""Plugins

Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
"Easy tags
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc.git'
Plugin 'xolox/vim-notes'
Plugin 'tpope/vim-fugitive.git'
Plugin 'sjl/gundo.vim.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'techlivezheng/vim-plugin-minibufexpl.git'
"Plugin 'bling/vim-bufferline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/a.vim' " Use :A to switch between header and cpp :AS splits and switches
Plugin 'ehamberg/vim-cute-python' " Python mathematical symbols
Plugin 'tclem/vim-arduino' " Arduino
Bundle 'derekwyatt/vim-scala' 

""All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "
" " Brief help
" " :PluginList          - list configured plugins
" " :PluginInstall(!)    - install (update) plugins
" " :PluginSearch(!) foo - search (or refresh cache first) for foo
" " :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line


set t_Co=256
colors zenburn


"Custom mappings

nnoremap U :GundoToggle<CR> 

""Fixes supertab 
let g:SuperTabDefaultCompletionType = "context"


""Opens quick fix window on make 
autocmd QuickFixCmdPost [^l]* nested cwindow 
autocmd QuickFixCmdPost l* nested lwindow

""Remotes the toolbar in gvim 
set guioptions-=T "remove toolbar

" Require tpope/vim-repeat to enable dot repeat support
" Jump to anywhere with only `s{char}{target}`
" `s<CR>` repeat last find motion.
nmap s <Plug>(easymotion-s)
" Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

set foldmethod=indent


au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

