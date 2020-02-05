" Plugins go here
call plug#begin('~/.vim/plugged') " Plugin directory 

Plug 'lervag/vimtex' " General latex plugin

"viewer settings

"here are the recommended settings for okular.
"unfortunately I couldn't get them working
" let g:latex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" let g:vimtex_view_general_options_latexmk = '--unique'
" use zathura
let g:vimtex_view_method='zathura'

Plug 'tpope/vim-fugitive' " git integration

Plug 'tpope/vim-surround' " parenthesizing

Plug 'ludovicchabant/vim-gutentags' " tag management

Plug 'lithammer/vim-eighties' " colorscheme

Plug 'JuliaEditorSupport/julia-vim' " Julia support

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" place for custom snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my-snippets"]


call plug#end()

" Makes syntax highlighting work for vimtex
filetype plugin indent on
syntax on

" Set local leader
let mapleader="\\"
let maplocalleader="\\"

" Whitespace stuff

" general settings
" set tabstop=2
set softtabstop=4
set shiftwidth=4
set expandtab

" use fewer spaces in some types
" (la)tex
autocmd Filetype tex setlocal softtabstop=2
autocmd Filetype tex setlocal shiftwidth=2
" yaml
autocmd Filetype yaml setlocal softtabstop=2
autocmd Filetype yaml setlocal shiftwidth=2

" theme
colorscheme eighties

" keep hidden buffers open
set hidden

" command-line completion
set wildmenu

" show partial commands
set showcmd

" highligh searches
set hlsearch

set cmdheight=2
set number
