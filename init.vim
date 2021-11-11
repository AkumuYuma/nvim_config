
" Plugin
call plug#begin('~/.config/nvim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'chemzqm/vim-jsx-improve'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
" gcc per commentare una linea, gc{motion} per commentare diverse linee
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Con repeat posso usare . per ripetere l'azione di surround
Plug 'tpope/vim-repeat'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'sharkdp/fd'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
call plug#end()


" ------------------------------------ Remaps -------------------------------
let mapleader=" "

" Salva con crtl-s
nnoremap <C-s> :w<cr>
" Apre l'explorer nella cartella contenente il file che sto editando
nnoremap <leader>ex  :Explore  "expand('%:h').'/'"<cr>
nnoremap <leader>vex :Vexplore "expand('%:h').'/'"<cr>
nnoremap <leader>sex :Sexplore "expand('%:h').'/'"<cr>
" Copia e incolla da clipboard
vnoremap <C-c> "+yi
vnoremap <C-x> "+c
vnoremap <C-v> c<esc>"+p
inoremap <C-v> <esc>"+pa
" remap di spostamento tra i buffer. Destra e sinistra per andare avanti e indietro, su e giu per passare a primo e ultimo
nnoremap <right> :bnext<cr>
nnoremap <left>  :bprev<cr>
nnoremap <up>    :bfirst<cr>
nnoremap <down>  :blast<cr>
" digita %% nella command line mode per avere il path del file attuale
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" ----------------------------------------------------------------------------

" ------------------------------------ Comandi -------------------------------
" Scratch per creare un nuovo buffer
command! Scratch lua require"init".makeScratch()
" Rel per fare salva e ricarica del file
command! Rel :w <bar> :so %

" ----------------------------------------------------------------------------


" --------------------------- Funzioni e autocomandi ------------------------
"  Cancella gli spazi bianchi alla fine di una riga
function! s:TrimWhiteSpace()
    " Salva il contesto attuale
    let l:save = winsaveview()
    " Sostituisce gli spazi bianchi alla fine di una frase con niente
    keeppatterns %s/\s\+$//e
    " Ripristina il contesto attuale
    call winrestview(l:save)
endfunction

" AutoComando per rimuovere gli spazi
augroup spazi
    " Rimuove tutti gli autocomandi per il gruppo
    " Se non lo mettessi, chiamerei l'autocomando ogni volta che il file viene caricato
    autocmd!
    " prima di scrivere sul buffer, eseguo su tutti i tipi di file (*) il comando :call TrimWhiteSpace per eliminare gli spazi
    autocmd BufWritePre * :call <SID>TrimWhiteSpace()
augroup END

" AutoComando per leggere i file .C come cpp
augroup cplusplus
    autocmd!
    autocmd BufNewFile,BufRead *.C set filetype=cpp
augroup END
" ----------------------------------------------------------------------------

" -------------------------- Impostazioni generiche --------------------------
colorscheme gruvbox
highlight Normal guibg=none

let g:rainbow_active = 1
" ----------------------------------------------------------------------------
