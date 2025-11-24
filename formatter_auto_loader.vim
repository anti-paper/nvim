" formatterオートローダ
for formatter in split(glob('~/.vim/formatter/*.vim'), '\n')
    execute 'source' formatter
endfor
