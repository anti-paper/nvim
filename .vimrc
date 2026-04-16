" 行番号表示
set number

" インデントはスペース4つ
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent

" 半角スペースを可視化
set listchars+=space:-
set list

" ヤンクした内容をクリップボードにも追加
set clipboard+=unnamedplus

" キーマップ
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

" netrw上でディレクトリ自動追尾 (vimgrep干渉防止のためautocmdに変更)
autocmd FileType netrw setlocal autochdir

" netrwが使うディレクトリとVimのcwdを同期
let g:netrw_keepdir = 0

source ~/.vim/formatter_auto_loader.vim
