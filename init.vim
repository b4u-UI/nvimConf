" ======================
" Plugin Setup (using vim-plug)
" ======================
call plug#begin('~/.local/share/nvim/plugged')

" Theme
Plug 'morhetz/gruvbox'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" Mini-game
Plug 'ThePrimeagen/vim-be-good'

" Auto-pairs
Plug 'windwp/nvim-autopairs'

" Syntax highlighting + auto-tag
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'

" File explorer + icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

" Status line
Plug 'nvim-lualine/lualine.nvim'

" Completion engine + sources
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

" LSP + Format/Lint
Plug 'neovim/nvim-lspconfig'
Plug 'nvimtools/none-ls.nvim'

" Fuzzy finder
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

call plug#end()

" ======================
" Lua Configs
" ======================

lua << EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
}

require('nvim-autopairs').setup({
  check_ts = true,
  ts_config = {
    jsx = {'string', 'template_string'},
    tsx = {'string', 'template_string'},
  },
  enable_check_bracket_line = false,
})

require("nvim-tree").setup({
  view = {
    side = "left",
    width = 30,
    adaptive_size = true,
  },
  float = {
    enable = false,
  },
})

require("lualine").setup()

vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-f>', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
EOF
" ======================
" Appearance & Theme
" ======================
syntax enable
set termguicolors
set background=dark
colorscheme catppuccin 

" ======================
" General Settings
" ======================
set number                " Show line numbers
set relativenumber        " Relative line numbers
set cursorline            " Highlight current line
set mouse=a               " Enable mouse support
set clipboard=unnamedplus " Use system clipboard
set nobackup
set nowritebackup
set noswapfile

" ======================
" Tabs & Indentation
" ======================
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" ======================
" Searching
" ======================
set incsearch
set hlsearch
set ignorecase
set smartcase

" ======================
" Splits & Navigation
" ======================
set splitright
set splitbelow
set scrolloff=5

" ======================
" Files & Undo
" ======================
set autoread
set undofile
set backup

set clipboard=unnamedplus

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
" Move between splits using Alt + h/j/k/l
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
