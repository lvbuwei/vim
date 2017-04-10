source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
if has("gui_macvim")
  let macvim_hig_shift_movement = 1
endif
set guifont=Consolas\ 11
colorscheme desert
set number

set rtp+=~/.vim/bundle/vundle/  
call vundle#rc()  
  
Bundle 'gmarik/vundle' 


Bundle 'tpope/vim-fugitive'  
Bundle 'Lokaltog/vim-easymotion'  
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}  
Bundle 'tpope/vim-rails.git'  
Bundle 'L9'  
Bundle 'FuzzyFinder'  
Bundle 'EasyGrep'  
Bundle 'git://git.wincent.com/command-t.git'  
  
filetype plugin indent on

syntax on
filetype on
filetype indent on
set autoindent
set smartindent
set cindent
set guioptions-=T
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set autochdir
set noerrorbells
set visualbell
set ruler
set shortmess=atI
set nolinebreak
set showcmd
set nowrapscan
set wrap
set showmatch
set nobackup
set noswapfile
set bufhidden=hide
set nowritebackup
set backspace=indent,eol,start
set nocp
set wildmenu
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set enc=utf-8
set ai
set ic
set hls
inoremap <F4> --LHQ <C-R>=strftime("%Y-%m-%d")<CR>

set diffopt+=iwhite
set diffexpr=""
map <F3> :NERDTree<CR>
let NERDTreeIgnore=['\.pyc']
map <F12> :!/usr/local/bin/tidy -config ~/bin/tidy.config -m -i -utf8 -xml %<CR>
set mouse=v
let g:sql_type_default='pgsql'
filetype plugin on
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set report=0
autocmd FileType html set textwidth=120
autocmd Filetype sql source ~/.vim/autoload/sql.vim
let g:sql_type_default = 'pgsql'

function CommaPos()
  let m=strpart(getline('.'),0,col('.'))
  return len(split(m,','))
endfunction

map <D-8> :call FormartSrc()<CR><CR>

func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
set rulerformat=%-14.(%{CommaPos()}\ %3l\ %3c\ %3V%)\ %P
hi User1 guifg=#eea040 guibg=#222222
hi User2 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222
let g:neocomplete#enable_at_start = 1
filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
set statusline+=%*
set runtimepath^=~/.vim/bundle/ag
