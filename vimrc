" -------------------------------------------------------
" Vundle part
" -------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin('~/.vim/plugged')
Plug 'sn3d/sn3d.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'hashivim/vim-terraform'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()            " required
" filetype plugin indent on    " required

" -------------------------------------------------------
" Editor settings
" -------------------------------------------------------
syntax on
colorscheme sn3d

" Flash screen instead of beep sound
set visualbell
set noerrorbells

" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8

" Set tab to 3 spaces
set tabstop=3
set softtabstop=3
set shiftwidth=3
set expandtab
set smartindent

" Enable mouse scrolling
set mouse=a

" Cursor is always block
set guicursor=

" Set leader to ',' it's required for shortcuts
let mapleader = ","

" -------------------------------------------------------
" FZF setup
" -------------------------------------------------------

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

" -------------------------------------------------------
" Go setup
" -------------------------------------------------------

" vim-go debug screen modif.
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
      \ 'out':        'botright 8new',
\ }

" show only OUT in output
let g:go_debug_log_output = ''

" vim-go error tweak
let g:go_list_type = "quickfix"

" auto-resolve imports when saving file
let g:go_fmt_command = "goimports"

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

" -------------------------------------------------------
" Shortcuts
"
" Basic
"    ,q - find file (fzf)
"
" Go
"    Ctrl+x Ctrl+o - autocomplete
"    Ctrl+], Crtl+[ - go to definition and back
"    ,b - Go build
"    ,d - Go documentation 
"    ,s - Go Info
"    ,q - Open file (fuzzy find)
"    ]] - next func.
"    [[ - prev.func.
"
"
" Go Debugging
"   ,1 - start debugging main
"   ,2 - start debugging test func.
"   ,3 - stop
"   ,5 - continue
"   ,6 - next
"   ,7 - step in
"   ,8 - step out
"   ,0 - place breakpoin
"
"   if you want to print variable, use the :GoDebugPring <var>
" -------------------------------------------------------
nnoremap <leader>q :ProjectFiles<CR>
nnoremap <leader>r :Ag 
nnoremap <leader>d :GoDoc<CR>
nnoremap <leader>s :GoInfo<CR>
nnoremap <leader>b :GoBuild<CR>
nnoremap <C-]> :GoDef<CR>
nnoremap <C-[> :GoDefPop<CR>

nnoremap <leader>1 :GoDebugStart<CR>
nnoremap <leader>2 :GoDebugTestFunc<CR>
nnoremap <leader>3 :GoDebugStop<CR>

nnoremap <leader>5 :GoDebugContinue<CR>
nnoremap <leader>6 :GoDebugNext<CR>
nnoremap <leader>7 :GoDebugStep<CR>
nnoremap <leader>8 :GoDebugStepOut<CR>
nnoremap <leader>0 :GoDebugBreakpoint<CR>

" on iPad you don't have ESC. As a 
" hack, I'm using 'jj' sequence. 
imap jj <Esc>

" ',g' - enable/disable NEDRtree
" ',d' - go to actual file in NERDTree
map <leader>g :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>

let NERDTreeShowHidden=1

" set indent for YAMLs
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

source $HOME/.config/nvim/plug-config/coc.vim

