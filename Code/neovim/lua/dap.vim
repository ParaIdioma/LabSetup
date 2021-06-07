" lua << EOF
    " local dap = require('dap')
    " dap.adapters.python = {
      " type = 'executable';
      " command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python';
      " args = { '-m', 'debugpy.adapter' };
    " }
" EOF
"
" lua require('dap-python').setup('~/Documents/virtualenvs/debugpy/bin/python')
" lua require('dap-python').test_runner = 'pytest'
"
" nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
" vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

" g:dap_virtual_text = true

" nnoremap <silent> <leader>da :lua require'dap'.continue()<CR>
" nnoremap <silent> <leader>do :lua require'dap'.step_over()<CR>
" nnoremap <silent> <leader>di :lua require'dap'.step_into()<CR>
" nnoremap <silent> <leader>du :lua require'dap'.step_out()<CR>
" nnoremap <silent> <leader>dt :lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <silent> <leader>db :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <leader>dp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
" nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
" nnoremap <silent> <leader>dl :lua require'dap'.repl.run_last()<CR>
