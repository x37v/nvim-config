let g:scTerminalBuffer = "on"
let g:scSplitDirection = "v"
au Filetype supercollider nnoremap <leader><CR> :call SClang_block()<CR>
au Filetype supercollider nnoremap <leader><space> :call SClang_line()<CR>
au Filetype supercollider nnoremap <leader>. :call SClangHardstop()<CR>
