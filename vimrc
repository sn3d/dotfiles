" -------------------------------------------------------
" Vundle part
" -------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'sn3d/sn3d.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'fatih/vim-go'
call vundle#end()            " required
filetype plugin indent on    " required

" -------------------------------------------------------
" Editor settings
" -------------------------------------------------------
syntax on
colorscheme sn3d

" Flash screen instead of beep sound
set visualbell

" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8

" Set tab to 3 spaces
set ts=3

" Enable mouse scrolling
set mouse=a

" Set leader to ',' it's required for shortcuts
let mapleader = ","

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

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

" -------------------------------------------------------
" Shortcuts
"
" Go
"    Ctrl+x Ctrl+o - autocomplete
"    Ctrl+], Crtl+[ - go to definition and back
"    ,d - Go documentation 
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
nnoremap <leader>d :GoDoc<CR>
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
map <leader>g :NERDTreeToggle<CR>

