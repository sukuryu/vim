set encoding=utf-8
scriptencoding utf-8

colorscheme ron
syntax on

set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 
set fileformats=unix,dos,mac
set ambiwidth=double 

set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set shiftwidth=4

set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

set whichwrap=b,s,h,l,<,>,[,],~
set number
set cursorline 
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

set showmatch
source $VIMRUNTIME/macros/matchit.vim

set wildmenu
set history=5000

if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

set backspace=indent,eol,start
set wildmenu wildmode=list:full

"行末まで検索したら行頭に戻る
set wrapscan

"読み込み専用かどうか表示
set statusline+=%r

"ヘルプページなら[HELP]と表示
set statusline+=%h

set pumheight=10


" bundleで管理するディレクトリを指定-------------------
set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle "ctrlpvim/ctrlp.vim"
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neocomplcache'

call neobundle#end()

filetype plugin indent on

