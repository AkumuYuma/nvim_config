" Funzione per aggiungere tutti i file al tracciamento
" fare un commit con commento Update
" e fare un push sul main
function! GitPush()
    Git add -A
    Git commit -m "Updates"
    " Chiedo conferma prima di fare il push
    let choice = confirm("Push su main?", "&Yes\n&No")
    if choice == 1
        Git push origin main
    endif
endfunction

" Creo il comando associato
command! GitPush call GitPush()

