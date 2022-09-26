" ###############################
" #######  :HELP OPTIONS  #######
" ###############################
set mouse=                                    " Disable the mouse
set syntax=on                                 " Syntax highlighting to show parts of the text in another font or color
set spell spelllang=en_us                     " Check for US English. The words that are not recognized are highlighted: z= opens up a list of suggestions, 1z= take the first one, moving between misspelled words: ]s and [s
set number                                    " Add numbers to each line on the left-hand side
set relativenumber                            " Show the line number relative to the line with the cursor
set hidden                                    " It hides buffers instead of closing them. This means that you can have unwritten changes to a file and open a new file using :e , without being forced to write or undo your changes first.
" Searches
" Vim by default seaches case sensitively, so if we search for apple we will
" find exactly that, but not Apple or APPLE
set ignorecase                                " Searches will become case insensitive, so if I search for apple I will get Apple, APPLE as well as apple
set smartcase                                 " With both ignorecase and smartcase turned on, a search is case-insensitive if you enter the search string in ALL lower case. For example, searching for apple will find Apple and APPLE. However, if your search string has one or more characters in upper case, it will assume that you want a case-sensitive search. So, searching for Apple will only give you Apple but not apple or APPLE.
set incsearch                                 " While searching through a file incrementally highlight matching characters as you type
set hlsearch                                  " Only the matching text is highlighted
set showmatch		                              " When a brancket is inserted, briefly jump to the matching one
set noerrorbells                              " Disable beeping due to Vim may beep or may flash its window if an error occurs
set smartindent                               " Reacts to the syntax/style of the code you are editing (especially for C). When having it on you also should have autoindent on.
set autoindent                                " Essentially tells vim to apply the indentation of the current line to the next (created by pressing enter in insert mode or with O or o in normal mode
set expandtab                                 " 
set shiftwidth=2                              " Set shift width to 2 spaces
set tabstop=2 softtabstop=2                   " Set tab 
set nowrap	                                  " Unser wrap long lines
set noswapfile
set undodir=~/.vim/undodir
set undofile
set signcolumn=number
set splitbelow
set splitright
set scrolloff=25
set noshowmode
set completeopt=menuone,noinsert,noselect     " 
set colorcolumn=100	                          " Comma-separated list of screen columns that are highlighted
set signcolumn=yes                            " The sign features allow both placement of a sign, or icon, in the left-hand side of the window and definition of a highlight which will be applied to that line.
set cmdheight=2
set cursorline                                " Highlight the text line
set cursorcolumn                              " Highlight the screen column of the cursor 
set autoread                                  " Automatically read files when they've changed
set nocompatible                              " Disable compatibility with vi which can cause unexpected issues
set iskeyword+=-                              " It treats the "abc-abc" as a one word
set clipboard=unnamedplus


" ################################
" #######  VIM LEADER KEY  #######
" ################################
let mapleader = " "
" Set mapping to save the file with using leader key
noremap <leader>w :w<cr>


" #########################################################
" #######  Turn on/off relativevumbers and numbers  #######
" #########################################################
" nnoremap <leader>on :set number relativenumber<CR>
" nnoremap <leader>on :set number! relativenumber!<CR>


" #############################
" #######  VIU PLUGINS  #######
" #############################
"  :PlugInstall   - Install plugins
"  :PlugUpdate    - Install or update plugins
"  :PlugUpgrade   - Upgrade vim-plug itself
"  :PlugStatus    - Check the status of plugins
" call plug#begin('~/.config/nvim/plugged')
call plug#begin(stdpath("data") . "/plugged")

  " Colorscheme Gruvbox
  Plug 'morhetz/gruvbox'

  " LSP Servers requirements
  Plug 'neovim/nvim-lspconfig'				" --> check installed servers: :LspInstallInfo
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'jose-elias-alvarez/null-ls.nvim'		" --> formatting/diagnostics a.k.a linters; check loaded fmt/linter: :NullLsInfo

  " Makes autocompletion 
  Plug 'hrsh7th/nvim-compe'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-nvim-lua'
	" Snippets
  Plug 'L3MON4D3/LuaSnip'
  Plug 'rafamadriz/friendly-snippets'

  " Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'

  " Prerequisites of Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  " Telescope
  Plug 'nvim-telescope/telescope.nvim'

  " Nvim tree
  Plug 'kyazdani42/nvim-web-devicons' 
  Plug 'kyazdani42/nvim-tree.lua'

  " Status bar
  Plug 'NTBBloodbath/galaxyline.nvim', { 'branch': 'main' } "Maintained galaxyline
  Plug 'kyazdani42/nvim-web-devicons'  " needed for galaxyline icons

  " Autopairs
  Plug 'windwp/nvim-autopairs'

  " Smoothie scroll
  Plug 'psliwka/vim-smoothie'

  " NerdTree
  Plug 'preservim/nerdtree'

  " Commenting
  " gc  = Toggle comments
  Plug 'tomtom/tcomment_vim'

  " Git
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'tpope/vim-fugitive'

call plug#end()


" ########################
" #######  COLORS  #######
" ########################
set background=dark
set termguicolors
silent! colorscheme gruvbox



" #############################
" ########  NVIM-TREE:  #######
" #############################
" a     = Add directory or file
" r     = Rename
" d     = Delete


" ##############################
" ########  COMPLETION:  #######
" ##############################
" Ctrl + p      = Move to the previous item
" Ctrl + n      = Move to the next item
" Ctrl + b      = Scrolling option in case of getting more text in snippets/buffers window
" Ctrl + f      = Scrolling option in case of getting more text in snippets/buffers window
" Ctrl + Space  = Giving us the list of all the available item completion
" Ctrl + e      = Exit 
" CR            = <Carriage return> a.k.a Enter key -> will confirm selection
" Tab           = Moving inside the parts of snippets


" #############################
" ########  TELESCOPE:  #######
" #############################
" <Space> + f           = search for files 
" <Space> + F           = search for text in files
" <Space> + fr          = search for references in files
" <Space> + fb          = seaerch for git branches


" #############################
" ########  TELESCOPE:  #######
" #############################
" - every get symbol is called hunk
" :gitsigns next_hunk       = move to the next hunk
" :gitsigns prev_hunk
" :gitsigns preview_hunk    = see what has been changed
" :gitsigns blame_hunk      = check who made a change



" #############################
" #######  LUA REQUIRE  #######
" #############################
lua <<EOF
require("nvim-tree-config")
require("completion")
require("statusbar")
require("treesitter")
require("lsp-config.lsp-installer")
require("lsp-config.language-servers")
require("gitsign")
require("mappings")
require("nullls")
require("autopair")
EOF
