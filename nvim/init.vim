" Using Vim-Plug to call plugins!
" ---------------------------------
call plug#begin('~/.vim_plugs')

" Dracula for Vim
Plug 'dracula/vim', {'as': 'dracula'}
" DevIcons
Plug 'ryanoasis/vim-devicons'
" Vim Airline
Plug 'vim-airline/vim-airline'
" Denite
Plug 'Shougo/denite.nvim', {'do': ':UpdateRemotePlugins' }
" NerdTree
Plug 'preservim/nerdtree'
" FZF
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

call plug#end()



" Plugins Configuration
" ---------------------------------
colorscheme dracula
set t_Co=256

" Vim Airline
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections=1
let g:airline_detect_modified=1
let g:airline_inactive_collapse=1
let g:airline_skip_empty_sections=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" NerdTree
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeIgnore=['.node_modules', '.cache']
let g:NERDTreeStatuslin=''
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" FZF
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-s': 'split',
	\ 'ctrl-v': 'vsplit'
	\}

" Nvim Configuration
" ---------------------------------
" Indentation
set autoindent
set shiftwidth=2
set tabstop=2

" Search
set hlsearch
set ignorecase
set incsearch
set smartcase
set rtp+=~/.fzf

" Performance
set complete-=i
set lazyredraw

" Text Rendering
set display+=lastline
set encoding=utf-8
set scrolloff=1
syntax enable
set wrap

" UI Options
hi Normal guibg=NONE ctermbg=NONE
" set termguicolors
set laststatus=2
set ruler
set number
set relativenumber
set noerrorbells
set title
set noshowmode

" Code Folding
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" Miscellaneous
set autoread
set backspace=indent,eol,start
set confirm
set history=1000