set mouse=a
set number
set title
set wildmenu
set wildmode=longest:full,full
set t_Co=256
set autoindent
set smarttab
set tabstop=4
set list
set listchars+=space:·

filetype plugin indent on
syntax on

" ==== Vim-Plug config ====

call plug#begin()
	" Appearance
	Plug 'vim-airline/vim-airline'
		" Theme
		Plug 'jaredgorski/spacecamp'

	" Utilities
	Plug 'sheerun/vim-polyglot'
	Plug 'jiangmiao/auto-pairs'
	Plug 'airblade/vim-gitgutter'

	" Completion and linters
	Plug 'neoclide/coc.nvim',  {'branch': 'release'}
	Plug 'plasticboy/vim-markdown'

call plug#end()

colorscheme spacecamp

source ~/.config/nvim/coc.vim
