" Operatore per fare il live grep della selezione. Funziona con i comandi di
" movimento normali di vim




" per far funzionare un operatore con i movimenti normali, devo settare
" operatorfunc a GrepOperator e poi chiamare l'operatore g@. L'operatore @g
" chiamerà la funzione in operatorfunc applicando il movimento in automatico
nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

" s: mi dichiara il nome solo nello scope locale del file, per poterlo leggere
" nei remap devo mettere <SID> prima della funzione da chiamare
function! s:GrepOperator(type)
    " Salvo il contenuto del registro @ prima di usarlo per copiare e
    " incollare la selezione
    let saved_register_content = @@

    if a:type ==# 'v'
        " Se sono in visual mode, eseguendo in normal mode
        " sposto il cursore all'inizio della selezione con `<
        " entro in visual mode con v
        " sposto il cursore alla fine della selezione con `>
        " copio il testo selezionato
        normal! `<v`>y
    elseif a:type ==# 'char'
        " Se  l'opeatore viene chiamato dalla normal mode, usando un movimento
        " imposto un mark all'inizio del pattern e copio dentro il range di movimento
        normal! `[v`]y
    else
        return
    endif

    " Nota i punti concatenano le stringhe
    " Nota che sto facendo il grep solo a partire dalla cartella in cui sto
    " editando. Se mettessi solo . come path di partenza, cercherebbe a
    " partire dalla cartella in cui si trova la shell esterna, e non l'editor
    silent execute "grep! -R ".shellescape(@@)." ".expand('%:h')."/"
    copen

    " Ripristino il conenuto del registro @@ dopo averlo usato
    let @@ = saved_register_content
endfunction


