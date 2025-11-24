" =========================================
" PHP: 自動整形 & pint.phar自動インストール
" =========================================

" pint.pharのパス
let s:pint_path = expand('~/.local/bin/pint')

" pintがなければ自動インストール
if !filereadable(s:pint_path)
    echo 'Installing Laravel Pint...'
    call system('curl -L https://github.com/laravel/pint/releases/latest/download/pint.phar -o ' . s:pint_path)
    call system('chmod +x ' . s:pint_path)
    echo 'Pint installed to ' . s:pint_path
endif

" 保存前にPintで整形
autocmd BufWritePost *.php call s:PintFormat()

function! s:PintFormat()
    let l:cmd = s:pint_path . ' ' . expand('%')
    " Pint実行・出力取得
    let l:output = systemlist(l:cmd)
    " ステータス取得
    let l:status = v:shell_error

    if l:status != 0
        " 整形失敗時・構文エラー時にメッセージ表示
        echohl ErrorMsg
        echom "PHP Pint failed with errors:"

        for line in l:output
            echom line
        endfor

        echohl None

        return
    endif

    " 成功した場合はバッファを再読み込みして整形を反映
    silent! execute 'edit!'
endfunction
