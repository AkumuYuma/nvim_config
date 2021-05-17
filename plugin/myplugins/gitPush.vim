

function! GitPush()
    " Funzione per aggiungere tutti i file al tracciamento
    " fare un commit con commento Update
    " e fare un push sul main
    Git add -A
    Git commit -m "Updates"
    let choice = confirm("Push su main?", "&Yes\n&No")
    if choice == 1
        Git push origin main
    endif
endfunction

command! Gitpush call GitPush()

