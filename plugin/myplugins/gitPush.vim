

function! GitPush()
    " Funzione per aggiungere tutti i file al tracciamento
    " fare un commit con commento Update
    " e fare un push sul main
    Git add -A
    Git commit -m "Updates"
    let choice = confirm("Push su main?", "&[Y]es\n&[N]o")
    if choice == 0
        Git push origin main
endfunction

command! Gitpush call GitPush()

