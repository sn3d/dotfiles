" -------------------------------------------------------
" Vundle part
" -------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin('~/.vim/plugged')
Plug 'sn3d/sn3d.vim'
Plug 'Shougo/ddc.vim'
"Plug 'vim-denops/denops.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'hashivim/vim-terraform'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
call plug#end() 

" -------------------------------------------------------
" Editor settings
" -------------------------------------------------------
syntax on
colorscheme sn3d

" Flash screen instead of beep sound
set visualbell
set noerrorbells

" Change how vim represents characters on the screen
set encoding=UTF-8

" Set the encoding of files written
set fileencoding=UTF-8

set updatetime=750

set colorcolumn=80

" Set tab to 3 spaces
set tabstop=3
set softtabstop=3
set shiftwidth=3
set expandtab
set smartindent

set clipboard+=unnamedplus

" Enable mouse scrolling
set mouse=a

" Cursor is always block
set guicursor=

" Set leader to ',' it's required for shortcuts
let mapleader = ","

" set theme or airline (bottom line)
let g:airline_theme="minimalist"
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" -------------------------------------------------------
" FZF setup
" -------------------------------------------------------

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
command! GoBuildMain execute 'GoBuild' s:find_git_root()

" -------------------------------------------------------
" Go setup
" -------------------------------------------------------

" vim-go debug screen modif.
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
      \ 'out':        'botright 10new',
\ }

" show only OUT in output
let g:go_debug_log_output = ''

" vim-go error tweak
let g:go_list_type = "quickfix"

" auto-resolve imports when saving file
let g:go_fmt_command = "goimports"

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

" ------------------------------------------------------
" UltiSnips
"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/snippets']
let g:UltiSnipsUsePythonVersion = 3

" -------------------------------------------------------
" Shortcuts
"
" Basic
"    ,q - find file (fzf)
"
" Git
"    ,bb - git blame
"
" Go
"    Ctrl+x Ctrl+o - autocomplete
"    Ctrl+], Crtl+[ - go to definition and back
"    ,b - Go build
"    ,d - Go documentation 
"    ,i - Go Info
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
nnoremap <leader>z  :GoBuild system('git rev-parse --show-toplevel 2> /dev/null')<CR>
nnoremap <leader>q  :ProjectFiles<CR>
nnoremap <leader>r  :Ag 
nnoremap <leader>bb :Gblame<CR>
nnoremap <leader>i  :GoInfo<CR>
nnoremap <leader>b  :GoBuildMain<CR>
nnoremap <C-]> :GoDef<CR>
nnoremap <C-[> :GoDefPop<CR>
au FileType go nmap <leader>d <Plug>(go-doc-vertical)

nnoremap <leader>1 :GoDebugStart<CR>
nnoremap <leader>2 :GoDebugTestFunc<CR>
nnoremap <leader>3 :GoDebugStop<CR>

nnoremap <leader>5 :GoDebugContinue<CR>
nnoremap <leader>6 :GoDebugNext<CR>
nnoremap <leader>7 :GoDebugStep<CR>
nnoremap <leader>8 :GoDebugStepOut<CR>
nnoremap <leader>0 :GoDebugBreakpoint<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" golang command aliases
command -nargs=1 Gp GoDebugPrint <args>

" on iPad you don't have ESC. As a 
" hack, I'm using 'jj' sequence. 
imap jj <Esc>

" ',g' - enable/disable NEDRtree
" ',fn' - go to actual file in NERDTree
map <leader>g :NERDTreeToggle<CR>
map <leader>fn :NERDTreeFind<CR>
" autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif

let NERDTreeShowHidden=1

" set indent for YAMLs
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" source $HOME/.config/nvim/plug-config/coc.vim

