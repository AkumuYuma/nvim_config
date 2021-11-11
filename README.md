# nvim_config
My neovim configuration files

# Guida all'uso.
Se sei in un ambiente UNIX vergine e vuoi utilizzare queste configurazioni segui i seguenti passaggi:
- `apt-get update` (Per aggiornare i pacchetti)
- `apt-get install neovim` (Per installare la versione più recente di neovim)
- `cd ~/.config` (se non esiste creare la cartella .config nella home directory)
- `mkdir ~/.config/neovim`
- `apt-get install nodejs` (Necessario per alcuni dei plugin)
- aprire neovim e installare i plugin con il comando `:PlugInstall`

Nota: Il repository praticamente contiene i file di impostazioni personali e il plugin manager, per questo è necessario installare i plugin con :PlugInstall.
I file relativi ai plugin non sono caricati sul repository sia perchè occuperebbero troppo spazio, sia perchè non sarebbero aggiornati.

Nota: Al momento della scrittura la versione ultima di nvim è 0.4.4. Perchè funzioni Telescope è necessaria la versione 0.5 (almeno) che non viene in automatico installata dal repo (con apt-get install neovim).
Questo darà dei messaggi di errore ogni volta che si aprirà neovim. Per evitarlo si può scaricare ed utilizzare la versione 0.5 direttamente facendo il download del binario, oppure rimuovere il plugin di Telescope.
# Come rimuovere un plugin
- Andare nel file init.vim e cancellare la riga corrispondente al plugin da eliminare.
- Aprire neovim e usare il comando `:PlugUpdate`
- Ad esempio potrebbe essere fastidioso coc.nvim per il supporto di python o telescope se la versione di nvim è precedente alla 0.5


