
" KEYBINDING HACKS
vnoremap < <gv
vnoremap > >gv

" Yank all content
nnoremap <leader>y ggVGy<C-o>
nnoremap Y y$

" Run text from line as command
nmap Q :.!sh<CR>

" Vertically center documents when in insert mode
autocmd InsertEnter * norm zz

" Remapping escape key
inoremap ;; <Esc>

" Disabling Escape key
" inoremap <Esc> <Nop>

" Remap za to space
" nnoremap <space> za

" Map leader
let mapleader = ";"

" Moving text
vnoremap <C-S-j> :m '>+1<CR>gv=gv
vnoremap <C-S-k> :m '<-2<CR>gv=gv
nnoremap <A-S-j> :m .+1<CR>
nnoremap <A-S-k> :m .-2<CR>

" Guide navigation
inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
noremap <leader><Tab> <Esc>/<++><Enter>"_c4l

" General insert command
inoremap ;g <++>

" Enable and disable spell checker
map <silent> <leader>s :setlocal spell!<CR>

"Enable and disable auto comment
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<CR>

"Enable and disable auto indentation
map <leader>a :setlocal autoindent<CR>
map <leader>A :setlocal noautoindent<CR>

