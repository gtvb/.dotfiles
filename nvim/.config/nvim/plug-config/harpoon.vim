nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-h> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-y> :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <leader>ha :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>hs :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>hd :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>hf :lua require("harpoon.ui").nav_file(4)<CR>

nnoremap <leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>
