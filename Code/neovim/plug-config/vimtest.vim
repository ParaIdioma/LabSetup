" https://github.com/vim-test/vim-test
nmap <silent><leader>tn :TestNearest<CR>
nmap <silent><leader>tf :TestFile<CR>
nmap <silent><leader>ts :TestSuite<CR>
nmap <silent><leader>tl :TestLast<CR>
nmap <silent><leader>tv :TestVisit<CR>
" make test commands execute using dispatch.vim
let test#strategy = "neoterm"
" let test#strategy = "neovim"
let test#python#runner = 'pytest'
