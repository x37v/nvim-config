"enable system clipboard, nvim-qt
"https://github.com/equalsraf/neovim-qt/pull/479
call GuiClipboard() 

set clipboard=unnamedplus

colorscheme evening
if has('macunix')
  Guifont Monaco:h14
else
  call GuiFont("DejaVu Sans Mono:h11")
endif
set guioptions=
set tw=0
"highlight Folded guifg=black guibg=lightred
