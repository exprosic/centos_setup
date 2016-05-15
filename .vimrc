set nocompatible
set backspace=start,eol,indent

filetype indent plugin on
syntax on

set ruler
set showcmd
set number
autocmd BufNewFile,BufReadPost *.py call InsertModeline('#')
autocmd BufNewFile,BufReadPost *.c,*.cpp,*.h,*.hpp call InsertModeline('//')

function! InsertModeline(commentchar)
        setlocal noexpandtab
        setlocal tabstop=4
        setlocal shiftwidth=4
        setlocal fileencoding=utf8

        let l:appendbefore = 1
        if getline(l:appendbefore) =~ '^#!'
                let l:appendbefore += 1
        endif
        if getline(l:appendbefore) =~ '\v\s(vi|vim|ex):'
                return
        endif

	let l:ml = a:commentchar
        let l:ml .= ' vim: set'
        let l:ml .= ' '.(&expandtab ? 'et' : 'noet')
        let l:ml .= ' ts='.&tabstop
        let l:ml .= ' sw='.&shiftwidth
        let l:ml .= ' fileencoding='.&encoding
	let l:ml .= ':'
        call append(l:appendbefore-1, l:ml)
endfunction

