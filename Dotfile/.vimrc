"nvim and vim use to common confuguration file
let mapleader = " "
imap jk <Esc>
set nu
set relativenumber
syntax on
set cursorline
set hlsearch
set ignorecase
set undofile
silent !mkdir -p ~/.cache/vim/undo
set undodir=~/.cache/vim/undo
set smartcase
"set mouse=a

"use copy to clipboard
"let g:clipboard = {
"\     'name' : 'xclip-git',
"\     'copy' : {
"\        '+': 'xclip -selection clipboard',
"\        '*' : 'xclip -selection primary'
"\    },
"\     'paste':{
"\        '+':'xclip -selection clipboard -o',
"\        '*':'xclip  -selection primary -o'
"\    },
"\    'cache_enable': 1,
"\}
"set clipboard=unnamedplus

"map
map QQ :q! <CR>
map WW :w <CR>
map NHL :nohlsearch <CR>

"代码补全(snippet)Tab键来选择补全
" Enter 确认选中项
"inoremap <silent><expr> <CR> pumvisible() ?coc#_select_confirm() : "\<CR>"


"<CR> is Enter
noremap H 5h
noremap L 5l
noremap J 5j
noremap K 5k

" Plugin
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'kovetskiy/vim-bash'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
"Plug 'neoclide/coc-snippets'
Plug 'lilydjwg/colorizer'
"Plug 'honza/vim-snippets'
Plug 'raimondi/delimitmate'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Or build from source code by using npm
"Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}

Plug 'voldikss/vim-floaterm'
Plug 'catppuccin/vim', { 'as': 'catppuccin', 'branch': 'main' }

Plug 'junegunn/fzf' 
Plug 'dylanaraps/wal.vim'

call plug#end()
map <silent> <C-e> :NERDTreeToggle<CR>
map <silent> <C-F> :FZF<CR>

set bg=dark
colorscheme catppuccin_frappe

"let g:gruvbox_contrast_light='hard'
let g:airline_theme = 'wal'
"let g:gruvbox_contrast_dark='medium'
"execute pathogen#infect()
"colorscheme catppuccin
" 跟随 pywal（wal.vim 会读取 ~/.cache/wal/colors-wal.vim）
"silent! colorscheme wal
" wal -i 后切回 vim 时自动重载配色
"autocmd FocusGained * silent! colorscheme wal

" 透明背景（配合 st alpha + picom 毛玻璃）
"unction! s:MakeTransparent() abort
" hi Normal       ctermbg=NONE guibg=NONE
" hi NonText      ctermbg=NONE guibg=NONE
" hi LineNr       ctermbg=NONE guibg=NONE
" hi SignColumn   ctermbg=NONE guibg=NONE
" hi EndOfBuffer  ctermbg=NONE guibg=NONE
" hi CursorLine   ctermbg=NONE guibg=NONE
" hi CursorLineNr ctermbg=NONE guibg=NONE
" hi StatusLine   ctermbg=NONE guibg=NONE
" hi StatusLineNC ctermbg=NONE guibg=NONE
" hi VertSplit    ctermbg=NONE guibg=NONE
" hi TabLine      ctermbg=NONE guibg=NONE
" hi TabLineFill  ctermbg=NONE guibg=NONE
" hi NormalFloat  ctermbg=NONE guibg=NONE
" hi Pmenu        ctermbg=NONE guibg=NONE
"ndfunction
"autocmd ColorScheme * call s:MakeTransparent()
"call s:MakeTransparent()
"let g:airline_theme='gruvbox'

"voldikss/vim-floaterm
""按键映射前缀: <leader>t。
let g:floaterm_keymap_new = '<Leader>tw'     "新建终端。
let g:floaterm_keymap_toggle = '<Leader>tt'  "终端显隐。
let g:floaterm_keymap_prev = '<Leader>tp'    "上一个终端。
let g:floaterm_keymap_next = '<Leader>tn'    "下一个终端。
let g:floaterm_keymap_kill = '<Leader>tk'    "关掉终端。
let g:floaterm_wintype = 'float'             "浮动窗口类型。
let g:floaterm_position = 'center'           "在窗口中间显示。
function! CheckBackspace() abort  
let col = col('.') - 1  
return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"markdown
filetype plugin indent on

autocmd FileType markdown setlocal expandtab
autocmd FileType markdown setlocal shiftwidth=2
autocmd FileType markdown setlocal tabstop=2
autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal conceallevel=2
autocmd FileType markdown setlocal concealcursor=nc
