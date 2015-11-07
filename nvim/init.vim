" Piers Barber
syntax on
au BufRead,BufNewFile *.vhdm set filetype=vhdl
au BufRead,BufNewFile *.sv   set filetype=verilog_systemverilog
au BufRead,BufNewFile *.svh  set filetype=verilog_systemverilog

" line numbering on
set number

" 3 space/tab-free indents for VHDL
set shiftwidth=3
set expandtab

" save/restore a file view (to get folds back)
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

" autocomplete on tab
:inoremap <tab> <c-n>

" disable cursor keys. hardcore.
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" <- diff put (dp)
noremap <A-Right> <esc>dp
" -> diff obtain (do)
noremap <A-Left> <esc>do

" set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
set guifont=Bitstream\ Vera\ Sans\ Mono\ 8

" if i'm running with the gui (faster than terminal on CentOS box!) then make it a useful width
if has("gui_running")
  set lines=65 columns=248
  set guioptions-=m "remove menubar
  set guioptions-=T "remove toolbar
endif

" this section makes colorscheme work under PuTTY
if &term =~ "xterm"
  "256 colours
  let &t_Co = 256
  " restore screen after quitting
  let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
  let &t_te = "\<Esc>[?47l\<Esc>8"
  if has("terminfo")
    let &t_Sf = "\<Esc>[3%p1%dm"
    let &t_Sb = "\<Esc>[4%p1%dm"
  else
    let &t_Sf = "\<Esc>[3%dm"
    let &t_Sb = "\<Esc>[4%dm"
  endif
endif

" select colorscheme according to whim
if &t_Co > 2 || has("gui_running")
" colorscheme myshell " taken from Walyd
" colorscheme toops   " taken from Ali
" colorscheme jellybeans
" colorscheme darkblue
" colorscheme monokai

  let g:molokai_original=0
  let g:rehash256=1
  colorscheme molokai
endif

set hlsearch
set history=50    " keep 50 lines of command line history
set ruler         " show the cursor position all the time
set cursorline    " highlight current line
set showcmd       " display incomplete commands
set incsearch     " do incremental searching

" let mapleader="," "default is \

:map <Leader>t :echo "Hello" <ESC>

" remove trailing spaces from all lines prior to saving
fun! <SID>StripTrailSpace()
   let l = line(".")
   let c = col(".")
   %s/\s\+$//e
   call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailSpace()