"  fzf.vim {{{
set wildmode=list:longest,list:full
set wildignore+=*.so,*.pyc,*.png,*.jpg,*.gif,*.jpeg,*.ico,*.pdf
set wildignore+=*.wav,*.mp4,*.mp3
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*
set wildignore+=_pycache_,.DS_Store,.vscode,.localized
set wildignore+=.cache,node_modules,package-lock.json,yarn.lock,dist,.git
set wildignore+=.vimruncmd
let $FZF_DEFAULT_COMMAND='fd --type file --color=always --follow --hidden --exclude .git'
let $FZF_DEFAULT_OPTS="--ansi"
" " fzf buffers view
noremap <Leader>fb :Buffers<CR>
" " fzf go to line
noremap <Leader>fl :Lines<CR>
" go to project directory
noremap <Leader>fd :Projects<CR>
" search  for files in main directories
noremap <Leader>fp :ProjectsFiles<CR>
" fzf most-recently-used file search
noremap <Leader>hh :History<CR>
" fzf most-recently-used command search
noremap <Leader>h: :History:<CR>
" fzf most-recently-used search
noremap <Leader>h/ :History/<CR>
" the ff g search
noremap <Leader>fr :Rg<CR>
" files search
noremap <Leader>ff :Files<CR>
" find in git repo
noremap <Leader>fg :GFiles<CR>
" find tags
noremap <Leader>ft :Tags<CR>
" find snippets
noremap <Leader>fs :Snippets<CR>
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
" inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
  " \ 'prefix': '^.*$',
  " \ 'source': 'rg -n ^ --color always',
  " \ 'options': '--ansi --delimiter : --nth 3..',
  " \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

" fzf search in Projects folder
" command! -nargs=0 Projects
" \ call fzf#run(fzf#wrap('projects', { 'dir': '/mnt/Ddata/Projects'
" \}, <bang>0))
function! s:plug_help_sink(line)
    let dir = g:plugs[a:line].dir
    for pat in ['doc/*.txt', 'README.md']
        let match = get(split(globpath(dir, pat), "\n"), 0, '')
        if len(match)
            execute 'tabedit' match
            return
        endif
    endfor
    tabnew
    execute 'Explore' dir
endfunction

command! PlugHelp call fzf#run(fzf#wrap({
            \ 'source': sort(keys(g:plugs)),
            \ 'sink':   function('s:plug_help_sink')}))
" }}}
