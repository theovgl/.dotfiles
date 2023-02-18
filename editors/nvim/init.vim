set mouse=a
set number
set title
set wildmenu
set wildmode=longest:full,full
set t_Co=256
set autoindent
set smarttab
set noexpandtab
set shiftwidth=4
set tabstop=4
set list
set listchars+=space:·

filetype plugin indent on
syntax on

" ==== Install Vim-Plug ====
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ==== Run PlugInstall if there are missing plugins ====
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" ==== Vim-Plug config ====

call plug#begin()
	" Appearance
	Plug 'vim-airline/vim-airline'
	Plug 'nvim-treesitter/nvim-treesitter'
	
	" Theme
	Plug 'jaredgorski/spacecamp'

	" Utilities
	Plug 'chrisbra/vim-commentary'
	Plug 'jiangmiao/auto-pairs'
	Plug 'airblade/vim-gitgutter'

	" Completion and linters
	Plug 'neoclide/coc.nvim',  {'branch': 'release'}
	Plug 'plasticboy/vim-markdown'

call plug#end()

colorscheme spacecamp

source ~/.config/nvim/plug-config/tree-sitter.vim
source ~/.config/nvim/coc.vim
