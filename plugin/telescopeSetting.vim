
" lua package.path = package.path .. ";/home/emanuele/.config/nvim/lua/telSettings.lua"
lua require("telSettings")
" Remaps
" Cerca nel progetto
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" Live grep (cerca file con keyword)
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" Cerca tra i buffer aperti
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" Cerca tra gli help tag
nnoremap <leader>fh <cmd>lua require('telSettings').search_home()<cr>
" remap per ricerca solo tra nvim config files
" eseguo la funzione search_dotfiles che si trova nel modulo lua.telescope
nnoremap <leader>vrc <cmd>lua require('telSettings').search_dotfiles()<cr>


