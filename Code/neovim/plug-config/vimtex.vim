"  Vimtex {{{
if empty(v:servername) && exists('*remote_startserver')
    call remote_startserver('VIM')
endif
let g:tex_flavor = 'latex'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_DefaultTargetFormat='pdf'
if has('nvim')
    let g:vimtex_compiler_progname = 'nvr'
endif
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_autoclose_after_keystrokes = 3
let g:vimtex_view_forward_search_on_start = 0
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-pdflatex="xelatex --shell-escape %O %S"',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ]
    \}
" }}}
