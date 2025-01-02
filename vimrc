" Spell checking
set spelllang=en
set spellfile=$HOME/my-config/en.utf-8.add
set spell

" Plugins go here
call plug#begin('~/.vim/plugged') " Plugin directory 

Plug 'lervag/vimtex' " General latex plugin

"default tex flavor
let g:tex_flavor = 'latex'

"viewer settings

"here are the recommended settings for okular.
"unfortunately I couldn't get them working
" let g:latex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" let g:vimtex_view_general_options_latexmk = '--unique'
" use zathura
let g:vimtex_view_method='zathura'
set conceallevel=1
let g:tex_conceal='abdmg'
" ignore some very common errors
let g:vimtex_quickfix_ignore_filters = [
            \ 'Marginpar on page',
            \ 'Overfull \\hbox',
            \ 'Underfull \\hbox',
            \]

Plug 'tpope/vim-fugitive' " git integration

Plug 'tpope/vim-surround' " parenthesizing

Plug 'ludovicchabant/vim-gutentags' " tag management

Plug 'lithammer/vim-eighties' " colorscheme

Plug 'JuliaEditorSupport/julia-vim' " Julia support

Plug 'kaarmu/typst.vim' " typst support

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="jk"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" place for custom snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", "/home/cmcs/.vim/my-snippets/ultisnips"]


call plug#end()

" Change cursor shape in different modes
let &t_EI = "\033[2 q" " NORMAL  █
let &t_SI = "\033[5 q" " INSERT  |
let &t_SR = "\033[3 q" " REPLACE _

" Mouse in terminal
set mouse=nv

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
set shiftwidth=0
set expandtab

" .cls are LaTeX files
autocmd BufNewFile,BufRead *.cls set syntax=tex

" use fewer spaces in some types
" (la)tex
autocmd Filetype tex setlocal softtabstop=2
autocmd Filetype tex setlocal shiftwidth=2
" yaml
autocmd Filetype yaml setlocal softtabstop=2
autocmd Filetype yaml setlocal shiftwidth=2
" html
autocmd Filetype html setlocal softtabstop=2
autocmd Filetype html setlocal shiftwidth=2
" css
autocmd Filetype css setlocal softtabstop=2
autocmd Filetype css setlocal shiftwidth=2

" keep hidden buffers open
set hidden

" command-line completion
set wildmenu

" show partial commands
set showcmd

" ignore some files when opening
" most of these are TeX-related
set wildignore=*.aux,*.bbl,*.bbl-SAVE-ERROR,*.bcf,*.bcf-SAVE-ERROR,*.blg,*.fdb_latexmk,*.fls,*.log,*.out,*.pdf,*.run.xml,*.synctex.gz

" highlight searches
" set hlsearch

set cmdheight=2
set number

" theme
colorscheme eighties

