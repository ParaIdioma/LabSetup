" Mappings {{{
" CDC = Change to Directory of Current file
" command CDC cd %:p:h
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>
" add space between text
nnoremap ss a<space><esc>h
" window
nmap <leader><leader>sw<left>  :topleft  vnew<CR>
nmap <leader><leader>sw<right> :botright vnew<CR>
nmap <leader><leader>sw<up>    :topleft  new<CR>
nmap <leader><leader>sw<down>  :botright new<CR>

" buffer
nmap <leader><leader>s<left>   :leftabove  vnew<CR>
nmap <leader><leader>s<right>  :rightbelow vnew<CR>
nmap <leader><leader>s<up>     :leftabove  new<CR>
nmap <leader><leader>s<down>   :rightbelow new<CR>

nmap <leader><leader>sh   :leftabove  vs<CR>
nmap <leader><leader>sl  :rightbelow vs<CR>
nmap <leader><leader>sk  :leftabove  split<CR>
nmap <leader><leader>sj   :rightbelow split<CR>

nmap <leader>hl :nohlsearch<CR>
"move by screen lines
:set wrap linebreak nolist breakindent
" move in line wraps but commands as lines
nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>".v:count.'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>".v:count.'k'
vnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>".v:count.'j'
vnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>".v:count.'k'
" mistype  correction
cnoreabbrev Term term
cnoreabbrev W! w!
cnoreabbrev W1 w!
cnoreabbrev w1 w!
cnoreabbrev Q! q!
cnoreabbrev Q1 q!
cnoreabbrev q1 q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" change word with the next in line, punctuation ignored
nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>:noh<CR>

" digraphs
" inoremap <C-d> <C-k>

"! Copy/Paste/Cut
noremap YY "py<CR>
noremap PP "pgP<CR>
noremap Pp "+gP<CR>
noremap XX "px<CR>

" Rename the current file
noremap <Leader>r :call Rename()<CR>
"" Buffer nav
noremap <leader>z :b#<CR>
noremap <leader>x :bn<CR>
" noremap <leader>q :bd<CR>
noremap <leader>q :b#<bar>bd#<CR>
"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Toggle insert mode language settings
let s:mappingLangState=0
command! TLM call ToggleLangMappings()
nmap <silent> <F3> :TLM<CR>
function! ToggleLangMappings()
    let s:mappingLangState = !s:mappingLangState
    if s:mappingLangState
        " " Lithuanian language
        inoremap cc č
        inoremap ss š
        inoremap zz ž
        inoremap CC Č
        inoremap SS Š
        inoremap ZZ Ž
        inoremap uu ū
        inoremap UU Ū
        inoremap uy ų
        inoremap UY Ų
        inoremap aa ą
        inoremap AA Ą
        inoremap ee ė
        inoremap EE Ė
        inoremap EW Ę
        inoremap ew ę
        inoremap ii į
        inoremap II Į
    else
        " " Lithuanian language
        iunmap cc
        iunmap ss
        iunmap zz
        iunmap CC
        iunmap SS
        iunmap ZZ
        iunmap uu
        iunmap UU
        iunmap uy
        iunmap UY
        iunmap aa
        iunmap AA
        iunmap ee
        iunmap EE
        iunmap EW
        iunmap ew
        iunmap ii
        iunmap II
    endif
endfunction
" Terminal mappings, use nvr to open from nvim terminal
if has('nvim')
    " nnoremap <c-c><c-c> :split term
    tnoremap <esc>      <c-\><c-n>
    " tnoremap <C-w> <C-\><C-n><C-w>h
    " tnoremap <C-j> <C-\><C-n><C-w>j
    " tnoremap <C-k> <C-\><C-n><C-w>k
    " tnoremap <C-l> <C-\><C-n><C-w>l
    " noremap <C-h> <C-w>h
    " noremap <C-j> <C-w>j
    " noremap <C-k> <C-w>k
    " noremap <C-l> <C-w>l
    " inoremap <C-h> <Esc><C-w>h
    " inoremap <C-j> <Esc><C-w>j
    " inoremap <C-k> <Esc><C-w>k
    " inoremap <C-l> <Esc><C-w>l
endif

" google translate via translate-shell
" command! -nargs=* -complete=shellcmd Rsplit execute "new | read !trans<Space>"
nnoremap <Leader>gt :Redir !trans<Space>
" nnoremap <Leader>gt :new | 0read ! trans<Space>
" Align current paragraph
noremap <leader>= =ip

" spelling {{{
let g:lexical#thesaurus = ['~/.vim/thesaurus/thesaurus.txt',]
set tsr='~/.vim/thesaurus/thesaurus.txt',
set spell spelllang=en,lt
let g:languagetool_jar='$HOME/LanguageTool/languagetool-commandline.jar'
" spelling mistakes -- insert mode first suggestion, normal mode go to
" suggestions
inoremap <C-q> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <C-q> [sz=<c-o>
" }}}
" open browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" ranger {{{
tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>
nnoremap <silent> <M-o> :RnvimrToggle<CR>
tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>
let g:rnvimr_enable_ex = 1
let g:rnvimr_enable_picker = 1
" Change the border's color
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}
" Link CursorLine into RnvimrNormal highlight in the Floating window
highlight link RnvimrNormal CursorLine
" Customize the initial layout
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': float2nr(round(0.6 * &columns)),
            \ 'height': float2nr(round(0.6 * &lines)),
            \ 'col': float2nr(round(0.2 * &columns)),
            \ 'row': float2nr(round(0.2 * &lines)),
            \ 'style': 'minimal' }
let g:rnvimr_presets = [
            \ {'width': 0.800, 'height': 0.800}]
" }}}
" }}}
