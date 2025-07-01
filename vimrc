" COLORSCHEME
" copy your favorite theme's repo into ./pack/themes/start/
" e.g. ./pack/themes/start/dracula
colorscheme catppuccin_mocha
set termguicolors

" Templates and Snippets
" visit templeman script
source $HOME/.config/vim/templeman.vim

" VIM SETTINGS 
" syntax and filetype related
syntax enable
filetype plugin indent on
set autoindent
set smartindent

" there is an space at the end of the last line
" this means end of each buffer is filled with \ character
set fillchars=eob:\ 
set title titlestring=%F

" vim doesn't want to be compatible with VI
set nocompatible

" highlite the line in which the cursor exists
set cursorline

" block cursor in normal and line cursor in insert?
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" line numbers 
set nu  

" line numbers are relative to the cursor
set relativenumber

" searching within a buffer settings
set incsearch
set ignorecase
set smartcase

" show matching brackets, parantheses, etc
set showmatch
set showmode

" commands and completing them with <TAB>
set showcmd 
set wildmenu

" statusline and tabline settings
set laststatus=2
set showtabline=2

" this actually expands path so you can search using :find * 
" sort of like fuzzy finding 
" I'd call this fizzy finding (** * this looks fizzy)
set path+=**
set wildignore+=**/node_modules/** 

" backspace behavior
set backspace=indent,eol,start

" disable the bells
set belloff=all

" disable automatic folding
set nofoldenable 

" completing doesnt insert automatically
set completeopt+=noinsert


" VIM KEY BINDINGS 
let mapleader=" "

" fizzy finding and editing 
nnoremap <leader>F :find *

" jump between buffers 
nnoremap <leader><TAB> :bn<CR>
nnoremap <leader>q :bd<CR>

" list of buffers
nnoremap <leader>l :ls<CR>

" newline and go back to normal
nnoremap <leader>oo o<ESC>

" window management
nnoremap <silent> <leader>wv :vsplit<cr>
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l


" netrw file manager  
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 15
noremap <leader>v :Lex<CR>
autocmd FileType netrw setl bufhidden=wipe


"spell checking 
nmap <leader>ss :setlocal spell spelllang=en_us,fr<CR>


"Latex Preview 
let g:livepreview_previewer = 'open -a Preview'
let g:livepreview_use_biber = 1


" Adding <> to tag matching system 
runtime macros/matchit.vim
set matchpairs+=<:>
function! VisualTagsWrap()
    if !exists('g:tags_to_wrap')
        let g:tags_to_wrap=[]
    endif
    let g:tags_to_wrap=split(input('Space-separated tags to wrap block: ', join(g:tags_to_wrap, ' ')), '\\s\\+')
    if len(g:tags_to_wrap) > 0
        execute 'normal! `>a</'.join(reverse(g:tags_to_wrap), '></').'>'  " Wrap opening tags
        execute 'normal! `<i<'.join(reverse(g:tags_to_wrap), '><').'>'  " Wrap closing tags
        execute 'normal! `>%</'.join(reverse(g:tags_to_wrap), '></').'>'  " Wrap opening tags
    endif
endfunction
vnoremap <silent>,w <ESC>:call VisualTagsWrap()<CR>
 

