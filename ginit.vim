"enable system clipboard, nvim-qt
"https://github.com/equalsraf/neovim-qt/pull/479
call GuiClipboard() 

set clipboard=unnamedplus

if has('macunix')
  colorscheme evening
  Guifont Monaco:h14
else
  colorscheme torte
  call GuiFont("DejaVu Sans Mono:h11")
endif
