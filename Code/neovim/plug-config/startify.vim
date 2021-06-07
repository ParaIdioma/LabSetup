" {{{ startify
let g:startify_custom_header = ['###']
let g:startify_custom_footer= ['###']

let g:startify_change_to_vcs_root = 1
let g:startify_session_sort = 1
let g:startify_session_autoload = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0

let g:webdevicons_enable_startify = 1
let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ '~/Downloads',
            \ '~/Documents',
            \ '~/Pictures',
            \ ]

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]

noremap <Leader>s :Startify<CR>
" }}}
