" ###############################
" #######  :HELP OPTIONS  #######
" ###############################
set nocompatible                              " Disable compatibility with vi which can cause unexpected issues
set noerrorbells                              " Disable beeping due to Vim may beep or may flash its window if an error occurs
set mouse=                                    " Disable the mouse
set spell spelllang=en_us                     " Check for US English. The words that are not recognized are highlighted: z= opens up a list of suggestions, 1z= take the first one, moving between misspelled words: ]s and [s
set noswapfile                                " Don't write intermediate swap files
set nobackup
" set backupskip='/tmp/*'
set winblend=0                                " Add transparency to floating windows wheres 100 is fully transparent 
set splitbelow                                " Splitting a window will put the new window below the current one
set splitright                                " Splitting a window will put the new window right of the current one
set scrolloff=25
set cmdheight=2
"set clipboard=unnamedplus
set backspace=indent,eol,start                " indent:	allow backspacing over autoindent; eol:	allow backspacing over line breaks (join lines); start	allow backspacing over the start of insert
set noswapfile
set undodir=~/.vim/undodir
set undofile
" ---------- User interface ----------
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8
set laststatus=2                              " Always display the status bar on the bottom
set syntax=on                                 " Syntax highlighting to show parts of the text in another font or color
set hidden                                    " It hides buffers instead of closing them. This means that you can have unwritten changes to a file and open a new file using :e , without being forced to write or undo your changes first.
set ruler                                     " Always show cursor position in the status bar
set title                                     " Set the window's title, reflecting the file currently being edited
set number                                    " Add numbers to each line on the left-hand side
set relativenumber                            " Show the line number relative to the line with the cursor
set showcmd                                   " Show the commands which you enter in the file
set showmode                                  " Always show what mode we're currently editing in
set wildmenu                                  " Displaycommand line's tab complete options as a menu
set wildoptions=pum                           " Gives scroll sign on the right side of the wildmenu
set pumblend=5                                " Adds transparency to wildmenu
" ---------- Search options ----------
set ignorecase                                " Searches will become case insensitive, so if I search for apple I will get Apple, APPLE as well as apple
set smartcase                                 " With both ignorecase and smartcase turned on, a search is case-insensitive if you enter the search string in ALL lower case. For example, searching for apple will find Apple and APPLE. However, if your search string has one or more characters in upper case, it will assume that you want a case-sensitive search. So, searching for Apple will only give you Apple but not apple or APPLE.
set incsearch                                 " While searching through a file incrementally highlight matching characters as you type
set hlsearch                                  " Adds a colored background to all the search results
set showmatch		                              " When a brancket is inserted, briefly jump to the matching one
" ---------- Indention options ----------
set smartindent                               " Reacts to the syntax/style of the code you are editing (especially for C). When having it on you also should have autoindent on.
set autoindent                                " Copy indent from current line when starting a new line
set expandtab                                 " Enter spaces when tab is pressed
set shiftround                                " Move selected lines with V using < > by spaces set in shiftwidth
set shiftwidth=2                              " When indenting with '>', use 4 spaces width
set tabstop=2                                 " Indent using 2 spaces
" ---------- Text options ----------
filetype on 
set nowrap	                                  " Unser wrap long lines
set cursorline                                " Highlight the text line
set cursorcolumn                              " Highlight the screen column of the cursor 
set colorcolumn=100	                          " Comma-separated list of screen columns that are highlighted
set signcolumn=yes                            " The sign features allow both placement of a sign, or icon, in the left-hand side of the window and definition of a highlight which will be applied to that line.
set signcolumn=number
" set textwidth=120                           " Break lines when line length increases
"set iskeyword+=-                              " It treats the "abc-abc" as a one word
set inccommand=split                          " During vim substitution :%s/ open the split in the bottom
set formatoptions+=j                          " Delete comment characters when joining lines



" ###############################
" #######  KEY BINDINGS   #######
" ###############################

" Leader key
nnoremap <SPACE> <Nop>
let mapleader = " "

" Set mapping to save the file with using leader key
nnoremap <leader>s :w<CR>:so %<CR>:echom 'Saved & Sourced init.vim'<CR>

" Enable/desable hlsearch
nnoremap <leader>h :noh<CR>

" Don't yank with x
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
nnoremap dw vb"_d

" Select all
nnoremap <C-a> gg<S-v>G

" New tab
nnoremap te :tabedit<return>
" Split window
nnoremap ss :split<return><C-w>w
nnoremap sv :vsplit<return><C-w>w
" Move window 
nnoremap <Space> <C-w>w
nnoremap sh <C-w>h
nnoremap sk <C-w>k
nnoremap sj <C-w>j
nnoremap sl <C-w>l
" Resize window
nnoremap <C-w><left> <C-w><
nnoremap <C-w><right> <C-w>>
nnoremap <C-w><up> <C-w>+
nnoremap <C-w><down> <C-w>-

" Enable/Disable relativenumber & numbers
function! ToggleLineNumber()
  set norelativenumber!
  set nonumber!
endfunction
map <leader>n :call ToggleLineNumber()<CR>

" Yank to clipboard
if system('uname -a | grep microsoft') != ''
  augroup myYank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe', @")
  augroup END
endif"

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
