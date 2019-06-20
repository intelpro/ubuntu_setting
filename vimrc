set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-python/python-syntax'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://v
" Plugin 'L9'
" Git plugin not hosted on GitHub
" easy tag plugin for ctags automatic generation 
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
" This two plugin is for easyfags 
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
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
" YCM install
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
call vundle#end()            " required
"NERDTree ON 단축키를 "\nt"로 설정
map <Leader>nt <ESC>:NERDTree<CR>
let NERDTreeShowHidden=1
" let NERDTreeQuitOnOpen=1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|vendor$',
    \ 'file': '\v\.(exe|so|dll)$'
\ }

" ycm 환경 설정 
let g:ycm_show_diagnostics_ui = 1 
let g:ycm_enable_diagnostic_signs = 1 
let g:ycm_enable_diagnostic_highlighting = 0 
let g:ycm_confirm_extra_conf = 1 
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['', '']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_error_symbol = '!'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
highlight YcmErrorSign guibg=#3f0000


" nnoremap gi :YcmCompleter GoToInclude
" nnoremap gD : YcmCompleter GoToDefinition
" nnoremap gd :YcmCompleter GoToDeclaration
" nnoremap t :YcmCompleter GetType
filetype on                                 "vim filetype on
"Source Explorer 환경설정
nmap <F8> :SrcExplToggle<CR>                "F8 Key = SrcExpl Toggling
nmap <C-H> <C-W>h                           "왼쪽 창으로 이동
nmap <C-J> <C-W>j                           "아래 창으로 이동
nmap <C-K> <C-W>k                           "윗 창으로 이동
nmap <C-L> <C-W>l                           "오른쪽 창으로 이동
" detail information 
set nu
set title
set showmatch
set ruler
" syntax setup
if has("syntax")
 syntax on
endif
colorscheme darcula
set t_Co=256
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
" 커서가 있는 줄을 강조함
set cursorline
" 상태바 표시를 항상한다
set laststatus=2 
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
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
" tags 설정
set tags=./tags
set tags+=../tags
noremap <c-]> 2<c-]>
" esay tags setting
let g:easytags_async = 1
let g:eatytags_auto_highlight = 0 
let g:easytags_include_member = 1
let g:easytags_dynamic_file = 1 
noremap <c-]> 2<c-]>
" highlighting
set hlsearch
let g:python_highlight_all = 1
let g:python_highlight_operators = 0
let g:python_highlight_space_errors = 0

"set directory 
set autochdir

"set WQ, wq, Wq, Q
:command WQ wq
:command Wq wq
:command W w
:command Q q
:cmap Q! q!

" vim syntatinc
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
