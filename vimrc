" note: comments are denoted with '"' not '#'
set nocompatible

set number
set scrolloff=10
set cursorline
hi CursorLine term=none cterm=none ctermbg=8
hi CursorLineNr term=bold cterm=none ctermfg=Yellow gui=bold guifg=Yellow guibg=NONE ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE
hi LineNr ctermbg=NONE
set showcmd
set formatoptions=r
syntax enable
let loaded_matchparen = 1
set autoindent
set hlsearch
set incsearch
set ignorecase
set smartcase
set ttyfast
set background=dark

"status line
"colours
hi MODE cterm=NONE ctermfg=236 ctermbg=081
hi FILE cterm=NONE ctermfg=230 ctermbg=240
hi MID  cterm=NONE ctermfg=245 ctermbg=236
hi POS  cterm=NONE ctermfg=249 ctermbg=240

function! GitBranch()

  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")

endfunction

function! StatuslineGit()

  let l:branchname = GitBranch()

  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''

endfunction

let g:currentmode={
    \ 'n'  : 'NORMAL',
    \ 'no' : 'NORMAL,OP',
    \ 'v'  : 'VISUAL',
    \ 'V'  : 'V-LINE',
    \ '^V' : 'V-BLOCK',
    \ 's'  : 'SELECT',
    \ 'S'  : 'S-LINE',
    \ '^S' : 'S-BLOCK',
    \ 'i'  : 'INSERT',
    \ 'R'  : 'REPLACE',
    \ 'Rv' : 'V-REPLACE',
    \ 'c'  : 'COMMAND',
    \ 'cv' : 'VIM EX',
    \ 'ce' : 'EX',
    \ 'r'  : 'PROMPT',
    \ 'rm' : 'MORE',
    \ 'r?' : 'CONFIRM',
    \ '!'  : 'SHELL',
    \ 't'  : 'TERMINAL'
    \}

set laststatus=2
set statusline=
set statusline+=%#MODE#\ 
set statusline+=%{g:currentmode[mode()]}\ 
set statusline+=%#FILE#\ 
set statusline+=%f\ 
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w\ 
set statusline+=%#MID#\ 
set statusline+=%=
"set statusline+=%{StatuslineGit()}\ 
set statusline+=[%{&ff}]\ 
set statusline+=%y\ 
set statusline+=%#POS#\ 
set statusline+=%l/%L,%c\ 
set statusline+=%p%%
set statusline+=\ 

"command binding
:command WQ wq
:command Wq wq
:command W w
:command Q q
