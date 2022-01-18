set nocompatible              " be iMproved, required
filetype on                  " required
filetype indent on
filetype plugin on
filetype plugin indent on
syntax on
syntax enable
set laststatus=2

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set langmenu=en_US.UTF-8
language messages en_US.UTF-8
set wrap
set wildmenu
set showcmd
" 开启鼠标模式
set mouse=a
" 使用系统剪贴板
set clipboard=unnamed
" ================= "
"   #1 VIM快捷键以基本设置
" ================= "

"  设置混合行
set number relativenumber
" 当前目录随编辑文件的改变而改变
set autochdir
" 设置leader按键,vscode 不能直接在这里面进行设置leader按键
let mapleader = ","
" 插入模式的快捷键设置
inoremap jj <ESC>
" 保存文件
noremap <C-S> :w<CR>
inoremap <C-s> <esc>:w<CR>
" 马上使此文件生效
map R :source $MYVIMRC<CR>
" 普通模式Q直接强制退出
noremap Q :q!<CR>

" 插入模式和普通模式快速跳转到行尾
map <C-L> $
map <C-H> 0
imap <C-L> <End>
" 删除整个单词,因为vim无法识别<C-BS>识别，所以只能使用<C-w>了
imap <C-H> <C-W>
nnoremap <c-Up> 8kzz
nnoremap <c-Down> 8jzz
" 快速分屏因为不常用s这个键位所以直接使用s(split)
nnoremap s<Right> :set splitright<CR>:vsplit<CR>
nnoremap s<left> :set nosplitright<CR>:vsplit<CR> 
nnoremap s<Up> :set nosplitbelow<CR>:split<CR>
nnoremap s<Down> :set splitbelow<CR>:split<CR>

" 分屏大小调整，使用h(horizon)加方向键
nnoremap h<Up> :res +5<CR>
nnoremap h<Down> :res -5<CR>
nnoremap h<Right> :vertical resize-5<CR>
nnoremap h<Left> :vertical resize+5<CR>

 " 快速建立新标签页以及标签页之间跳转
nnoremap tu :tabe<CR>
nnoremap tn :+tabnext<CR>
nnoremap tp :-tabnext<CR>

" 保证一定有5行可以显示
set scrolloff=5
" 缩进
set smarttab
set autoindent      " 打开自动缩进
set smartindent     " 打开智能缩进
filetype indent on " 根据文件自动缩进
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
retab!
noremap <Tab> >>
noremap <S-Tab> <<

" 代码折叠
set fdm=indent
set foldmethod=indent
set foldlevel=99
" Ctrl组合键的保留
" 全选键
map <C-A>  ggVG
imap <C-A>  <ESC>ggVG
" 智能搜索
set hlsearch
set incsearch
set ignorecase
set smartcase
" =-为查找下一个和下一个且自动居中
noremap = nzz
noremap - Nzz
" 设置高亮
set cursorline
set cursorcolumn
" CursorLine 和 CursorColumn 分别表示当前所在的行列
" cterm 表示为原生vim设置样式，设置为NONE表示可以自定义设置。
" ctermbg 设置终端vim的背景色
" ctermfg 设置终端vim的前景色

" ================= "
"   #2 插件管理
" ================= "
" 更换快速的源
" 国内源，两个轮着使用
" let g:plug_url_format='https://git::@hub.fastgit.org/%s.git'
" 国外源,有代理还是使用国外源，注意不要多打空格
let g:plug_url_format='https://git::@github.com/%s.git'

call plug#begin('~/.config/nvim/plugged')
" call plug#begin('~/AppData/Local/nvim/plugged') Windows下面的
" 插件列表

" 状态栏插件
Plug 'vim-airline/vim-airline'
"主题配色插件
Plug 'mhartington/oceanic-next'
" 快速跳转
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
" 文件目录
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" 错误检测
Plug 'dense-analysis/ale'
"  函数名/标签显示
Plug 'preservim/tagbar'
" 自动补全coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'

" 撤销树
Plug 'mbbill/undotree'
" 括号增强版本
Plug 'luochen1990/rainbow'
" 注释插件
Plug 'tpope/vim-commentary' 
" 多光标插件
Plug 'terryma/vim-multiple-cursors'
" 对函数内部的文本对象进行增强
Plug 'vim-scripts/argtextobj.vim'
" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'fadein/vim-FIGlet'

call plug#end()

set termguicolors
" vim主题插件配置
" 这个主题下的是airline的配色，可以自己更改
let g:airline_theme='oceanicnext'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
" 最后使用配色不然配置都不成功了
" color gruvbox
" 背景透明
colorscheme OceanicNext   
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" ===
" === NERDTree
" ===
noremap tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"

" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" 自动补全coc
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Make <CR>/<Tab> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" Java自动添加import和删除多余import Alt+Enter
noremap <leader><Space>  :CocAction<CR>
" 添加`:Format`命令格式化当前缓冲区。
command! -nargs=0 Format :call CocAction('format')
" 代码格式化
noremap <leader>f :Format<CR>
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
" Use gh查看 文档(默认是K) to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" ALE
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\}
let g:ale_java_javac_options = '-encoding UTF-8  -J-Duser.language=en'
"普通模式下，前往上一个错误或警告，前往下一个错误或警告
nnoremap <leader>p <Plug>(ale_previous_wrap)
nnoremap <leader>n <Plug>(ale_next_wr,p)

" 关闭<C-h>快捷键和自己的快捷键冲突了,不然不可以使用Ctrl+BS了
let g:AutoPairsMapCh = 0
let g:AutoPairsMapCR = 0

" rainbow
let g:rainbow_active = 1 
    let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}


" tagBar大概设置,支持easymotion查找
nmap tb :tagbartoggle<cr>

" 快速注释插件 默认开启
" gcc 注释当前行 gc可以添加文本对象动作之后整行注释，也可以在Visual模式下使用

" 进入多光标模式的时候，最底层有白色块提示，只有白色块没有了才会回到普通模式
" neovim兼容性问题
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

let g:multi_cursor_use_default_mapping=0

" 自定义
let g:multi_cursor_start_word_key      = 'gb'
let g:multi_cursor_select_all_word_key = 'ga'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = 'gb'
let g:multi_cursor_prev_key            = 'gp'
let g:multi_cursor_skip_key            = 'gx'
let g:multi_cursor_quit_key            = '<esc>'
