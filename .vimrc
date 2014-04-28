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
Plugin 'tpope/vim-fugitive.git'
Plugin 'sjl/gundo.vim.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'techlivezheng/vim-plugin-minibufexpl.git'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'ervandew/supertab'


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


""Custom mappings

nnoremap U :GundoToggle<CR>
map <Leader> <Plug>(easymotion-prefix)

colorscheme desert
