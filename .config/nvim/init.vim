if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
" Run Async Shell Commands
Plug 'skywind3000/asyncrun.vim'
" Async file running
Plug 'pedsm/sprint'
" Asynchronous keyword completion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'
" Git Integration
Plug 'tpope/vim-fugitive'
" Asynchronous Lint Engine
Plug 'w0rp/ale'
" Syntax Checking/Highlighting
Plug 'nvie/vim-flake8'
" Auto-close bracket...
Plug 'Raimondi/delimitMate'
" Auto-Indentation
Plug 'vim-scripts/indentpython.vim'
" Remove extraneous whitespace when edit mode is exited
Plug 'thirtythreeforty/lessspace.vim'
" Solarized color
Plug 'altercation/vim-colors-solarized'
" Status bar mods
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

call plug#end()

""" Asyncrun """
nnoremap <F5> :Sprint <CR>
let g:deoplete#enable_at_startup = 1

""" Coding Suff """
" Highlight 80th column
if exists('+colorcolumn')
    set colorcolumn=79
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
" Always show status bar
set laststatus=2
" Let plugins show effects after 500ms, not 4s
set updatetime=500
" Disable mouse click to go to position
set mouse-=a
" Don't let autocomplete affect usual typing habits
set completeopt=menuone,preview,noinsert
" Let vim-gitgutter do its thing on large files
let g:gitgutter_max_signs=10000

" If using a powerline patched font, we can set airline to display glyphs
let g:airline_powerline_fonts = 1
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

""" Python stuff """"
syntax enable
set number showmatch
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
let python_highlight_all = 1

" Configure neovim to run in the same virtual env every time.
" Thus, we only need to pip install neovim on it and not in every env we use
" let g:python3_host_prog = '/full/path/to/envs/neovim3/bin/python'

" Format python code
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

" UTF8 Support
set encoding=utf-8

" Set font when running in gui
"set guifont=Inconsolata\ Nerd\ Font\ Mono\ Medium \18

"""" Color Schemes """"""
set background=light
colorscheme solarized
set t_Co=256
" Airline Theme
let g:airline_theme = 'base16_solarized'
let g:solarized_termcolors=256

