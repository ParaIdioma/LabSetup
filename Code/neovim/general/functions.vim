" FUNCTIONS {{{
function! s:CleanEmptyBuffers() "{{{ Delete empty buffers
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0 && !getbufvar(v:val, "&mod")')
    if !empty(buffers)
        exe 'bw ' . join(buffers, ' ')
    endif
endfunction
" }}}
" From defaults.vim jump to last position cursor {{{
augroup vimStartup
    au!
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
                \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
                \ |   exe "normal! g`\""
                \ | endif

augroup END
" }}}
" TERMINAL BEHAVIOR {{{
 augroup TerminalBehavior
   autocmd!
   autocmd TermOpen * setlocal listchars= nonumber norelativenumber nowrap winfixwidth noruler signcolumn=no noshowmode
   autocmd TermOpen * startinsert
   autocmd TermClose * set showmode ruler
 augroup END
" }}}
" Get visualy selected text {{{
function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction "}}}
" MATLAB helpers {{{
" linting {{{
function! MatlabLint()
    let filename = expand('%:p')
    execute "T mlint(strtrim('".filename"'))"
endfunction
autocmd FileType matlab noremap <buffer><localleader>l :call MatlabLint()<CR>
" }}}
" matlab code formatting {{{
function! MatlabFormat()
    let filename = expand('%:p')
    execute "T MBeautify.formatFile(strtrim('".filename"'))"
endfunction
autocmd FileType matlab noremap <buffer><localleader>= :call MatlabFormat()<CR>
 "}}}
" matlab imagesc selected variable {{{
function! MatlabImagesc()
    let name = s:get_visual_selection()
    execute "T imagesc(".name")"
endfunction
com! -range -nargs=* I <line1>,<line2>call MatlabImagesc()
 "}}}
" matlab plot selected variable {{{
function! MatlabPlot()
    let name = s:get_visual_selection()
    execute "T plot(".name")"
endfunction
com! -range -nargs=* P <line1>,<line2>call MatlabPlot()
 "}}}
" matlab get size of visual selection {{{
function! MatlabSize()
    let name = s:get_visual_selection()
    execute "T class(".name")"
    execute "T size(".name")"
endfunction
com! -range -nargs=* S <line1>,<line2>call MatlabSize()
 "}}}
" faster help on word behind cursor {{{
function! MatlabHelp2()
    let name = expand("<cword>")
    execute "T help " .name
endfunction
autocmd FileType matlab noremap <buffer><localleader>h :call MatlabHelp2()<CR>
"}}}
" matlab get help on selection {{{
function! MatlabHelp()
    let name = s:get_visual_selection()
    execute "T help ".name
endfunction
com! -range -nargs=* H <line1>,<line2>call MatlabHelp()
" }}}

" Rename the current file
function! Rename()
    let current = expand('%')
    let new_file = input('New name: ', current)
    if new_file != current && new_file != ''
        exec ':saveas ' . new_file
        exec ':silent !rm ' . current
        redraw!
    endif
endfunction

"Autosave only when there is something to save. Always saving makes build watchers crazy {{{
function! SaveIfUnsaved()
    if &modified
        :silent! w
    endif
endfunction
au FocusLost,BufLeave,TabLeave * :call SaveIfUnsaved()
" Read the file on focus/buffer enter
au FocusGained,BufEnter * :silent! !
" }}}
" }}}
" Python helpers {{{
"
" faster help on word behind cursor {{{
function! PythonHelp()
    let name = expand("<cword>")
    execute "T help(".name")"
endfunction
autocmd FileType python noremap <buffer><localleader>? :call PythonHelp()<CR>
"}}}
" python plot selected variable {{{
function! PythonPlot()
    let name = expand("<cword>")
    execute "T plt.plot(".name")"
endfunction
" com! -range -nargs=* R <line1>,<line2>call PythonPlot()
autocmd FileType python noremap <buffer><localleader>p :call PythonPlot()<CR>
 "}}}
" python variable head {{{
function! PythonHead()
    let name = expand("<cword>")
    execute "T ".name".head()"
endfunction
" com! -range -nargs=* R <line1>,<line2>call PythonPlot()
autocmd FileType python noremap <buffer><localleader>h :call PythonHead()<CR>
 "}}}
" python get shape selected variable {{{
function! PythonShape()
    let name = expand("<cword>")
    execute "T np.shape(".name")"
    execute "T np.size(".name")"
endfunction
com! -range -nargs=* I <line1>,<line2>call PythonShape()
autocmd FileType python noremap <buffer><localleader>i :call PythonShape()<CR>
 "}}}
" }}}
" Vim start execute {{{
" autocmd VimEnter *
            " \  if !argc()
            " \ |  Startify
            " \ |  Sex
            " \ |  wincmd w
            " \ | endif
" }}}
" Redirect the output of a Vim or external command into a scratch buffer {{{
" https://gist.github.com/romainl/eae0a260ab9c135390c30cd370c20cd7
function! Redir(cmd, rng, start, end)
	for win in range(1, winnr('$'))
		if getwinvar(win, 'scratch')
			execute win . 'windo close'
		endif
	endfor
	if a:cmd =~ '^!'
		let cmd = a:cmd =~' %'
			\ ? matchstr(substitute(a:cmd, ' %', ' ' . expand('%:p'), ''), '^!\zs.*')
			\ : matchstr(a:cmd, '^!\zs.*')
		if a:rng == 0
			let output = systemlist(cmd)
		else
			let joined_lines = join(getline(a:start, a:end), '\n')
			let cleaned_lines = substitute(shellescape(joined_lines), "'\\\\''", "\\\\'", 'g')
			let output = systemlist(cmd . " <<< $" . cleaned_lines)
		endif
	else
		redir => output
		execute a:cmd
		redir END
		let output = split(output, "\n")
	endif
	vnew
	let w:scratch = 1
	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
	call setline(1, output)
endfunction

command! -nargs=1 -complete=command -bar -range Redir silent call Redir(<q-args>, <range>, <line1>, <line2>)
" }}}
" }}}
