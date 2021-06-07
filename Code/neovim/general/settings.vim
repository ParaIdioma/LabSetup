" BASE {{{
set secure " prohibit .vimrc files to create or execute
set novisualbell    " don't beep
set noerrorbells  " don't beep
" set belloff
set clipboard+=unnamed
set foldmethod=marker
" swap files
set backupdir=~/.config/nvim/temp,.
set directory=~/.config/nvim/temp,.
set conceallevel=1
set mouse=a
set pyx=3
set undofile
set undodir=~/.config/nvim/temp
" move cursor after $
set virtualedit=block
set ignorecase
set smartcase
set lazyredraw
set hidden
set nu
" mark 81st column
set textwidth=0
set colorcolumn=80
set completeopt=menuone,preview
if has('termguicolors')
  set termguicolors
endif
" For dark version.
set background=dark
" For light version.
" set background=light
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
" let g:gruvbox_material_background = 'soft'
" colorscheme gruvbox-material
colorscheme gruvbox
" E363
set mmp=5000
" colorscheme nord
" set bg=light
" set bg=dark
"
" }}}
" statusline {{{
" function! GitBranch()
  " return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
" endfunction
"
" function! StatuslineGit()
  " let l:branchname = GitBranch()
  " return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
" endfunction

set statusline=
" set statusline+=%#PmenuSel#
" set statusline+=%{StatuslineGit()}
set statusline+=\ \ %f
" set statusline+=%#LineNr#
set statusline+=\ %y
set statusline+=%=
" set statusline+=%#CursorColumn#
" set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" set statusline+=\[%{&fileformat}\]
set statusline+=\ %l:%c
set statusline+=\ %p%%
set statusline+=\ %n
" }}}
" Map leader {{{
let mapleader="\<space>"
let maplocalleader='\'
" }}}}
