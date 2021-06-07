" Vim-Plug {{{
if !filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    if !executable("curl")
        echoerr "You have to install curl or first install vim-plug yourself!"
        execute "q!"
    endif
    echo "Installing Vim-Plug..."
    echo ""
    silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" }}}
" Plugins {{{
call plug#begin('~/.config/nvim/plugged')
" !  other
" debug startup
" Plug 'dstein64/vim-startuptime'
" Debug
" Plug 'puremourning/vimspector'
" Plug 'mfussenegger/nvim-dap'
" Plug 'mfussenegger/nvim-dap-python'
" Plug 'theHamsta/nvim-dap-virtual-text'
" ! IDE like plugins
" Plug 'junegunn/vim-peekaboo'
Plug 'gennaro-tedesco/nvim-peekup'
Plug 'tpope/vim-endwise'
Plug 'tmsvg/pear-tree'
Plug 'kevinhwang91/rnvimr'
Plug 'vim-test/vim-test'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" " Transpose
Plug 'salsifis/vim-transpose'
" " sa{ sd{ sr{ {-b automatic
Plug 'machakann/vim-sandwich'
Plug 'tyru/open-browser.vim'
" " automatic indent
Plug 'tpope/vim-sleuth'
" " additional commands
Plug 'tpope/vim-eunuch'
" " Language spelling TODO
" Plug 'reedes/vim-lexical'
" Plug 'vim-scripts/LanguageTool' " grammar mistakes :LanguageToolCheck
Plug 'reedes/vim-wordy', {'for': ['text', 'markdown', 'latex']}
" " :OnlineTheausaurusCurrentWord TODO
" Plug 'beloglazov/vim-online-thesaurus'
Plug 'rhysd/vim-grammarous'
"" " show whitespace
Plug 'ntpeters/vim-better-whitespace'
Plug 'lambdalisue/suda.vim'
" " Show things on Vim empty startup
Plug 'mhinz/vim-startify'
" " Add comments
Plug 'scrooloose/nerdcommenter'
Plug 'jbgutierrez/vim-better-comments'
Plug 'vim-scripts/LargeFile'
" " align text on symbol etc. :Tabularaze =
Plug 'godlygeek/tabular'
" " alignment plug-in
Plug 'junegunn/vim-easy-align'
" "  show indentation levels
" Plug 'Yggdroot/indentLine'
" Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
Plug 'p00f/nvim-ts-rainbow'
" " resize windows with Ctrl+E and hjkl
Plug 'simeji/winresizer'
" " marks performed search live
Plug 'markonm/traces.vim'
" " fancy history of files :mundotree
Plug 'simnalamburt/vim-mundo'
" " extend f
" Plug 'rhysd/clever-f.vim'
" " lsp
" " Plug 'neovim/nvim-lsp'
" " Plug 'haorenW1025/completion-nvim'
" " Plug 'haorenW1025/diagnostic-nvim'
"
" " coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" " increment numbers values C-A C-X
Plug 'qwertologe/nextval.vim'
" " move visual blocks
Plug 'zirrostig/vim-schlepp'
" " ! Find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"" Snippets
Plug 'SirVer/ultisnips'
" Vim Terminal
" TREPL send file line to terminal inside vim
Plug 'kassio/neoterm'
" Terminal
Plug 'voldikss/vim-floaterm'
" Languages
" Latex
Plug 'lervag/vimtex'
" Python
Plug 'goerz/jupytext.vim'
" ledger
Plug 'ledger/vim-ledger'
" zotero
" Plug 'jalvesaq/zotcite'
" color-schemes
" Plug 'arcticicestudio/nord-vim'
" Plug 'sainnhe/gruvbox-material'
Plug 'ChristianChiarulli/nvcode-color-schemes.vim'
" Plug 'thiagoalessio/rainbow_levels.vim' color by identation level
Plug 'wfxr/minimap.vim'
" Plug 'unblevable/quick-scope'
Plug 'phaazon/hop.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'}
call plug#end()
" " }}}
