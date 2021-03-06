set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://v
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Indentation guildline tools 
Plugin 'Yggdroot/indentLine'
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin),
"Plugin 'file:///home/jjeaby/Dev/tools/vim-plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" All of your Plugins must be added before the following line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" YCM install
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'xolox/vim-misc'
" python syntax
Plugin 'vim-python/python-syntax'
" colorscheme
Plugin 'sainnhe/gruvbox-material'
" vim tmux navigator
Plugin 'christoomey/vim-tmux-navigator'
" latex
Plugin 'xuhdev/vim-latex-live-preview'
" vim tags
Plugin 'ludovicchabant/vim-gutentags'
call vundle#end()            " required

let g:tablineclosebutton=1
"NERDTree ON 단축키를 "\nt"로 설정
map <C-e> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" let NERDTreeQuitOnOpen=1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|vendor$',
    \ 'file': '\v\.(exe|so|dll)$'
\ }
let g:nerdtree_tabs_open_on_console_startup=0
" vim airline
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" tags 설정
set tags=./tags
set tags+=../tags
noremap <c-]> 2<c-]>
" ycm 환경 설정 
let g:ycm_show_diagnostics_ui = 1
let g:ycm_echo_current_diagnostic = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0 
let g:ycm_confirm_extra_conf = 1 
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['', '']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_error_symbol = '!'
let g:pymode_rope_complete_on_dot = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
highlight YcmErrorSign guibg=#3f0000

" nnoremap gi :YcmCompleter GoToInclude
" nnoremap gD : YcmCompleter GoToDefinition
" nnoremap gd :YcmCompleter GoToDeclaration
" nnoremap t :YcmCompleter GetType
"Source Explorer 환경설정
nmap <F8> :SrcExplToggle<CR>                "F8 Key = SrcExpl Toggling
nmap <C-H> <C-W>h                           "왼쪽 창으로 이동
nmap <C-J> <C-W>j                           "아래 창으로 이동
nmap <C-K> <C-W>k                           "윗 창으로 이동
nmap <C-L> <C-W>l                           "오른쪽 창으로 이동
" tabnew normap
ca tn tabnew
noremap <S-l> gt
noremap <S-h> gT
" detail information 
set nu
set title
set showmatch
set ruler
" syntax setup
if has("syntax")
 syntax on
endif
filetype plugin indent on 
" set paste
set autoindent
set cindent
set cinkeys -=0#
set smartindent
inoremap { {<CR>}<up><end><CR>
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
" 붙여넣기 설정
set mouse=a
" 한글 입력 설정
set encoding=utf-8
set termencoding=utf-8
" 검색 설정
set ignorecase
" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" Markdown 문법 설정 (Git 에서 사용)
augroup markdown
    " remove previous autocmds
    autocmd!
    " set every new or read *.md buffer to use the markdown filetype
    autocmd BufRead,BufNew *.md setf markdown
augroup END

autocmd BufRead *.py inoremap # X<c-h>#<space>
au BufRead,BufNewFile *.pde,*.ino set filetype=c++
noremap <c-]> 2<c-]>
" highlighting
set hlsearch
let g:python_highlight_all = 1
let g:python_highlight_operators = 0
let g:python_highlight_space_errors = 0
let g:python_highlight_func_calls = 0

"set directory 
set autochdir

"set WQ, wq, Wq, Q
:command WQ wq
:command Wq wq
:command W w
:command Q q
:cmap Q! q!

" vim syntatinc
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"color
" set termguicolors
set background=dark
" set contrast
let g:gruvbox_material_background = 'medium'
colorscheme gruvbox-material
let g:airline_theme = 'base16'
set t_Co=256
let base16colorspace=256   " Access colors present in 256 colorspace
" colorscheme base16-default-dark
" set split with crtlp
set splitright
" tmux navigation 
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-l> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-a> :TmuxNavigatePrevious<cr>
set shell=/bin/bash
" disalbe statline syntatics
let g:statline_syntastic = 0
" gutentags
let g:gutentags_project_root = ['.svn','.git','.root', 'COPYING','.project']
set statusline+=%{gutentags#statusline()}
" clipboard
set clipboard=unnamedplus
highlight Comment term=bold cterm=bold ctermfg=245
" indentline
let g:indentLine_color_gui = '#4c4c4b'
let g:indentLine_color_term = 239
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)


