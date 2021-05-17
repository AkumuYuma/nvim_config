
function! GitPush()
    " Funzione per aggiungere tutti i file al tracciamento
    " fare un commit con commento Update
    " e fare un push sul main
    Git add -A
    Git commit -m "Updates"
endfunction

command! Gitpush call GitPush()

