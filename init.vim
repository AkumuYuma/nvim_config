" Plugin
call plug#begin('~/.config/nvim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
call plug#end()

" Remaps
let mapleader=" "
nnoremap <leader>ex :Ex<CR>
nnoremap <leader>vex :Vex<CR>
nnoremap <leader>sex :Sex<CR>
" Copia e involla da clipboard
vnoremap <C-c> "+yi
vnoremap <C-x> "+c
vnoremap <C-v> c<esc>"+p
inoremap <C-v> <esc>"+pa
" digita %% nella command line mode per avere il path del file attuale
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" remap di spostamento tra i buffer
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprev<cr>
nnoremap <leader>bb :bfirst<cr>
nnoremap <leader>BB :blast<cr>

" Impostazioni generiche
colorscheme gruvbox
highlight Normal guibg=none

let g:rainbow_active = 1

" Plain vim func and autocommand

fun! TrimWhiteSpace()
    " Salva il contesto attuale
    let l:save = winsaveview()
    " Sostituisce gli spazi bianchi alla fine di una frase con niente
    keeppatterns %s/\s\+$//e
    " Ripristina il contesto attuale
    call winrestview(l:save)
endfun

augroup spazi
    " Rimuove tutti gli autocomandi per il gruppo
    " Se non lo mettessi, chiamerei l'autocomando ogni volta che il file viene caricato
    autocmd!
    " prima di scrivere sul buffer, eseguo su tutti i tipi di file (*) il comando :call TrimWhiteSpace per eliminare gli spazi
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END

command! Scratch lua require"init".makeScratch()
