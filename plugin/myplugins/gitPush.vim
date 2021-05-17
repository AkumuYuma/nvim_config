
function! GitPush()
    " Funzione per aggiungere tutti i file al tracciamento
    " fare un commit con commento Update
    " e fare un push sul main
    Git add -A
    Git commit -m "Updates"
    Git push origin main
endfunction

command! Gitpush call GitPush()

