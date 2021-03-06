set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" add all plugins here
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'vim-latex/vim-latex'
Plugin 'dracula/vim'
Plugin 'udalov/kotlin-vim'

" all plugins must be added before this line
call vundle#end()
filetype plugin indent on

" specify a directory for vim-plug plugins
call plug#begin('~/.vim/plugged')

" add all plugins here
Plug 'fatih/vim-go'
Plug 'lervag/vimtex'
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'

" all plugins must be added before this line
call plug#end()

" powerline plugin
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup

" specify split areas
set splitbelow
set splitright

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" enable folding
set foldmethod=indent
set foldlevel=99

" enable folding with the spacebar
nnoremap <space> za

" python PEP8 indentation
au BufNewFile,BufRead *.py
	\set tabstop=4 |
  	\set softtabstop=4 |
  	\set shiftwidth=4 |
  	\set textwidth=79 |
  	\set expandtab |
  	\set autoindent |
  	\set fileformat=unix |

" flag unwanted whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.h,*.c match BadWhitespace /\s\+$/

" utf-8 support
set encoding=utf-8

" autocompletion customization
let g:ycm_autoclose_preview_window_after_completion=1

" code highlight
let python_highlight_all=1
syntax on

" color scheme logic
"if has('gui_running')
"	set background=dark
"	colorscheme solarized
"else
"	colorscheme zenburn
"endif

" search highlight
set hlsearch
hi Search ctermbg=Yellow
hi Search ctermfg=Red

" switching between color schemes
call togglebg#map("<F5>")

" hide .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$']

" turn on line numbering
set nu

" indentation settings
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

" ycmd server troubleshooting
let g:ycm_server_python_interpreter = '/usr/bin/python3'

" vimtex configuration
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" UltiSnips configuration
let g:UltiSnipsSnippetDirectories = ["/home/xuedong/.vim/plugged/vim-snippets/UltiSnips/", "UltiSnips"]
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

