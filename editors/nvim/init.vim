set mouse=a
set number
set title
set wildmenu
set wildmode=longest:full,full
set t_Co=256

filetype plugin indent on
syntax on

" ==== Vim-Plug config ====

call plug#begin()
	" Appearance
	Plug 'vim-airline/vim-airline'

	" Utilities
	Plug 'sheerun/vim-polyglot'
	Plug 'jiangmiao/auto-pairs'

	" Completion and linters
	Plug 'neoclide/coc.nvim',  {'branch': 'master', 'do': 'npm install'}
	Plug 'plasticboy/vim-markdown'

call plug#end()
