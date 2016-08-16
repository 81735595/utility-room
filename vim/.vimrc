"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本格式和排版
"
filetype plugin indent on   " 按件类型缩进
set formatoptions=tcrqn     " 自动格式化
set autoindent          " 继承前一行的缩进方式，特别适用于多行注释
set expandtab
set ts=4
set tabstop=4           " 制表符为4
set softtabstop=4       " 统一缩进为4
set shiftwidth=4
set t_Co=256
set linespace=4
colorscheme molokai

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索和匹配 
"
set showmatch           " 高亮显示匹配的括号
set scrolloff=10        " 光标移动到buffer的顶部和底部时保持10行距离
set novisualbell        " 不要闪烁
set hlsearch            " 高亮搜索
set laststatus=2        " 总是显示状态行
set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}
                " 我的状态行显示的内容（包括文件类型和解码）

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件设置
"
set shortmess=atI       " 启动的时候不显示那个援助索马里儿童的提示`
set report=0            " 通过使用: commands命令，告诉我们文件的哪一行被改变过
set fillchars=vert:\ ,stl:\     " 在被分割的窗口间显示空白，便于阅读 ,stlnc:\(加了这个wm>分割兰有\\\\\\\\\\\\\)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一般设置
"
set viminfo+=!          " 保存全局变量
set history=300         " history文件中需要记录的行数
set nocompatible        " 不要使用vi的键盘模式，而是vim自己的
set foldmethod=indent   " 设置折叠模式为按缩进折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
set foldlevel=100       " 启动vim时不要自动折叠代码
set nu
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set ruler
set showmatch           " 高亮显示匹配的括号 
filetype on             " 侦测文件类型 
set nobackup            " 不要备份文件（根据自己需要取舍） 
"set backup
syntax enable
syntax on           " 语法高亮 
set magic           " 设置正表达式
set backspace=indent,eol,start  " 这指明在插入模式下在哪里允许 <BS> 删除光标前面的字符。
                " 逗号分隔的三个值分别指：行首的空白字符，换行符和插入模式开始处之前的字>符。
set showcmd             " 在 Vim 窗口右下角，标尺的右边显示未完成的命令
" :inoremap ( ()<ESC>i
" :inoremap { {}<ESC>i
" :inoremap [ []<ESC>i
" :inoremap " ""<ESC>i
" :inoremap ' ''<ESC>i

"set encoding=utf-8,gbk
set pastetoggle=<F12>
"set diffexpr=MyDiff()
"function MyDiff()
"    let opt = '-a --binary '
"    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"    let arg1 = v:fname_in
"    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"    let arg2 = v:fname_new
"    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"    let arg3 = v:fname_out
"    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"    let eq = ''
"    if $VIMRUNTIME =~ ' '
"        if &sh =~ '\<cmd'
"            let cmd = '""' . $VIMRUNTIME . '\diff"'
"            let eq = '"'
"        else
"            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"        endif
"    else
"        let cmd = $VIMRUNTIME . '\diff'
"    endif
"    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction
"
" macvim设置
set guifont=Monaco:h18
"set mouse=a

" winManager和netrw结合
let g:Netrw_title="[Netrw]"

function! Netrw_Start()   
     exec 'Explore'   
endfunction   
    
function! Netrw_IsValid()   
     return 1   
endfunction   

let g:winManagerWindowLayout='BufExplorer|Netrw'

"设置winmanager的宽度，默认为25
let g:winManagerWidth = 30
"定义打开关闭winmanager按键
nmap <silent> <F8> :WMToggle<cr>

"切换缓冲区
nmap gn :bN<cr>
"在选择模式下系统复制
vmap ,c "+y<ESC>
vmap ,C "+Y<ESC>
"在选择模式下系统剪切
vmap ,x x:let @+=@"<CR>
"系统粘贴
map ,v "+p
map ,V "+P
"重新载.vimrc设置文件
map ,ls :source ~\.vimrc<CR>:nohl<CR>
"保存文件
map ,s :w<CR>
"切换切割区域
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

