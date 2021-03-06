"Default config
syntax on

set novisualbell
set noeb
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set bs=2                " Allow backspacing over everything in insert mode
set ai                  " Always set auto-indenting on
set ruler               " Show the cursor position all the time
set diffopt+=vertical
set linebreak " makes it so that words don't get cut in 1/2 when soft word wrapping occurs

"default yank is the system clipboard
set clipboard=unnamedplus

""""""""""""""""""""""
""Plugin setup
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'scrooloose/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
"can convert camel<->snake etc
Plug 'tpope/vim-abolish'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/vis'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/Buffer-grep'
Plug 'x37v/scvim', { 'branch': 'relative-file' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rust-lang/rust.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'OmniSharp/omnisharp-vim'
Plug 'bfredl/nvim-miniyank'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'cespare/vim-toml'

if has('macunix')
Plug 'gfontenot/vim-xcode'
endif

call plug#end()


""""""""""""""""""""""
""Plugin config
runtime coc-init.vim
runtime omnisharp.vim
runtime sc.vim

"CtrlP stuff
nmap ; :CtrlPRoot<CR>
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_max_files=0
"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|target|build|vendor|node_modules|dist)$',
  \ 'file': '\v\.(exe|so|dllo|swp|pyc|wav|mp3|ogg|blend|html|xml)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"miniyank
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

" mundo
" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo

"ale
let g:ale_fix_on_save = 1
let g:ale_fixers = { 
 \ 'javascript': ['eslint'],
 \ 'typescript': ['eslint']
 \ }
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"

"git
command! -bar -bang -nargs=* Gci :Gcommit<bang> -v <args>

"editor config
let g:EditorConfig_exclude_patterns = ['fugitive://.*']


""""""""""""""""""""""
""File Type details

au FileType rust
  \ set sw=4 ts=4 expandtab softtabstop=4 signcolumn=yes
  \ | compiler cargo
  \ | map <Leader><Space> :make build<CR>
  \ | let g:rustfmt_autosave = 1
  \ | let g:rustfmt_command = "rustup run stable rustfmt"

au FileType yaml
  \ set sw=2 ts=2 expandtab softtabstop=2 signcolumn=yes

au FileType cpp
  \ noremap <Space> :A<CR>

""""""""""""""""""""""
""Global key bindings

nmap \be :BufExplorer<CR> 
nmap \e  :NERDTreeToggle<CR>
nmap \l :setlocal number!<CR>
nmap \o :set paste!<CR>

map <Down> :cnext<CR>
map <Up> :cprevious<CR>
map <Left> :bprev<CR>
map <Right> :bnext<CR>
map <C-Down> :lnext<CR>
map <C-Up> :lprevious<CR>

"make vis.vim commands happen by default in visual mode
vnoremap / :S 
vnoremap : :B 
"vis.vim end

"comment a visual block using //
vnoremap // :s/^\(\s*\)/\1\/\//<cr>:noh<cr> 
"uncomment a visual block using \\
vnoremap \\ :s/^\(\s*\)\/\//\1/<cr>:noh<cr>

"auto read external changes, :checktime needed to work around nvim issue https://github.com/neovim/neovim/issues/1936
set autoread
au FocusGained * :checktime

"don't ignore anything
let NERDTreeIgnore=[]

"neovide settings
let g:neovide_cursor_animation_length=0.01
colorscheme torte
set guifont=DejaVuSansMono:h16
set guioptions=
set tw=0
highlight Folded guifg=black guibg=lightred
highlight Pmenu guibg=black
