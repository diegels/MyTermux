"         __                     
" .--.--.|__|.--------.----.----.
" |  |  ||  ||        |   _|  __|
"  \___/ |__||__|__|__|__| |____|
"
" REQUIRED {{{ 


set nocompatible              " be iMproved, required
filetype off                  " required

source ~/.filetype.vim
source ~/.keybindings.vim
" }}}

" PLUGINS {{{

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/plugins')

Plugin 'VundleVim/Vundle.vim'

" Customization
Plugin 'vim-airline/vim-airline'
Plugin 'ryanoasis/vim-devicons'			" For icons
Plugin 'dylanaraps/wal.vim'

" Must have
Plugin 'tpope/vim-surround'    
Plugin 'scrooloose/nerdtree'			" added nerdtree
Plugin 'junegunn/goyo.vim'
Plugin 'farmergreg/vim-lastplace'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'mhinz/vim-startify'

" Web Development
Plugin 'ap/vim-css-color'
Plugin 'mattn/emmet-vim'

" Python Development
Plugin 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Syntax highlighting
Plugin 'vim-python/python-syntax'
Plugin 'plasticboy/vim-markdown'
Plugin 'neomutt/neomutt.vim'

" Vim Wiki
Plugin 'vimwiki/vimwiki'

call vundle#end()

" }}}

" BASIC CONFIGURATION {{{

filetype plugin indent on
syntax enable
set noswapfile
"set number relativenumber
set path+=**
set wildmode=longest,list,full
set wildignore=*.o,*.obj,*.bak,*.exe,*.hi,*.dyn_hi,*.dyn_o,*.zip,*.pdf
set encoding=UTF-8
set nofoldenable
set foldmethod=marker
set foldmarker={{{,}}}
set showmatch				" Show matching brackets.
set linebreak
set ignorecase				" Do case insensitive matching
set smartcase				" Do smart case matching
set clipboard+=unnamedplus	" Use System Clipboard
set mouse=a					" Enable mouse usage (all modes)
set tabstop=4     
set shiftwidth=4  
set softtabstop=4 
set spelllang=en_us
set fillchars+=vert:│,fold:-,eob:\ 
set nolist
set cursorline
set culopt=both
set autoindent
set smartindent
set colorcolumn
set cursorcolumn
set termguicolors
set nowrap
set ruler
set incsearch
set autochdir
set spell
set spelllang=en_us
set sps=best
set hlsearch
set ea
set ls=2
set hidden
set ead=both	
set splitbelow splitright
set term=xterm-256color
set tty=xterm-256color
set ttyfast
set esckeys
set icon
set showcmd
set showmode
set verbose
set confirm
set vb
set ma
set bs=indent,eol,start
set cpt=.,w,b,u,t,kspell
set cot=menu,preview
set timeoutlen=1000
set ttm=500
set ffs=unix
set write
set autoread
set noswapfile
set warn
set loadplugins
set secure
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=number
set signcolumn=auto
set stl=%!airline#statusline(2)
"}}}

" colors  {{{

colorscheme murphy
set background=dark


" Highlight Whitespaces
highlight Whitespace ctermfg=Grey
highlight ColumnLine guibg=Blue cterm=Underline
highlight CursorColumn ctermbg=1 guibg=Blue cterm=bold

" Makes comments italic
highlight Comment cterm=italic

" Customize spell check highlighting
highlight SpellBad ctermbg=Red ctermfg=White
highlight SpellCap cterm=NONE ctermbg=NONE
highlight SpellRare cterm=NONE ctermbg=NONE
highlight SpellLocal cterm=undercurl ctermbg=NONE


" highlight LineNr ctermbg=NONE ctermfg=White
highlight VertSplit ctermbg=NONE ctermfg=White

" Customize folds
highlight Folded ctermfg=Black ctermbg=Red cterm=bold

" }}}

" key bindings

" esc key
inoremap jk <esc>

" leader kdy
let mapleader="<space>"

" prefix key
nmap ; :
nmap ; :

"}}}






" VIMWIKI {{{

let g:vimwiki_list = [{'auto_diary_index': 1}]

" }}}

" MARKDOWN {{{
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_toc_autofit = 1
" }}}

" STARTIFY {{{

let g:startify_files_number = 10
let g:startify_update_oldfiles = 1
let g:startify_change_to_vcs_root = 0
let g:startify_padding_left = 4
let g:startify_session_autoload = 0
let g:startify_session_dir = '~/.vim/session'
" let g:startify_custom_header =
"             \ startify#pad(split(system('figlet -f chunky technicaldc'), '\n'))

let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   BOOKMARKS:']      },
          \ { 'type': 'files',     'header': ['   RECENTS:']            },
          \ { 'type': 'dir',       'header': ['   CURRENT DIRECTORY: '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   SESSIONS:']       },
          \ { 'type': 'commands',  'header': ['   COMMANDS:']       },
          \ ]

let g:startify_bookmarks = [
		\ { 'g': '~/github_token.md' },
		\ { 'w': '~/vimwiki/index.wiki' },
		\]

let g:startify_custom_header = [ "", 
	\ "",
	\ "	███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗		",
	\ "	████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║      ",
	\ "	██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║      ",
	\ "	██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║      ",
	\ "	██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║		",
	\ "	╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝		",
	\ "",
	\ ]

let g:startify_custom_footer = ''

highlight StartifyBracket ctermfg=Green
highlight StartifySlash ctermfg=Green
highlight StartifyFile ctermfg=Yellow
highlight StartifySection cterm=Bold ctermfg=Red
highlight StartifySpecial ctermfg=Magenta

" }}}

" EMMET-VIM {{{

let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_mode='a'    "enable all function in all mode.
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall

" }}}

" VIM AIRLINE THEME {{{

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_theme='murmur'
" let g:airline_theme='minimalist'
" let g:airline_theme='dracula'

" }}}

" NERD TREE CONFIG {{{

nnoremap <silent> tt :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=0
let NERDTreeShowHidden=0
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=23

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" }}}

" NERD COMMENTER {{{

" Key binding for comment: ',cc'
" Key binding for uncomment: ',cu'

" Create default mappings
let g:NERDCreateDefaultMappings = 0

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 0

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" }}}

" GOYO {{{

let g:goyo_width = 80
let g:goyo_height = 30
let g:goyo_liner = 0

map <silent> <leader>gy :Goyo<CR> 

" }}}


" FZF {{{

" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []

 
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>e :History<CR>

command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, {'options': ['--preview', 'batcat {}']}, <bang>0)
command! -bang -nargs=? -complete=dir GFiles
			\ call fzf#vim#gitfiles(<q-args>, {'options': ['--preview', 'batcat {}']}, <bang>0)

" }}}

" TABS, SPLITS AND BUFFERS {{{

" MANAGING BUFFERS
nnoremap <A-C> :bprevious<CR>
nnoremap <A-c> :bnext<CR>

" MANAGING TABS
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <A-t> :TabVifm<CR>
nnoremap <silent> <A-n> :tabnew<CR> 
nnoremap <silent> <A-,> :tabmove -<CR>
nnoremap <silent> <A-.> :tabmove +<CR>

" MANAGING SPLITS
set splitbelow splitright

" Open terminal in split
nnoremap <leader>st :sp<space>\|<space>terminal<CR>
nnoremap <leader>vt :vs<space>\|<space>terminal<CR>

" Change splits from vertical to horizontal and vice versa
" Horizontal to vertical
map <leader>th <C-w>t<C-w>H
" Vertical to horizontal
map <leader>tk <C-w>t<C-w>K

" Remap splits navigation to just ( Ctrl + hjkl)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Keybindings for split resizing
noremap <silent> <A-l> :vertical resize +2<CR>
noremap <silent> <A-h> :vertical resize -2<CR>
noremap <silent> <A-k> :resize +2<CR>
noremap <silent> <A-j> :resize -2<CR>

" }}}

" OTHER {{{

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.

" Source a global configuration file if available
"if filereadable("/usr/share/vim/vimrc")
"  source /usr/share/vim/vimrc
"endif

" vimrc:fdm=marker:foldlevel=0

" }}}
