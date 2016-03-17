" Font
if has("win32")
	set gfn=Consolas:h10:cANSI
else
	set gfn=Monospace\ 9
endif

" Remove GUI elements.
set guioptions-=T " Remove toolbar
set guioptions-=m " Remove menubar
set guioptions-=l " Remove left scrollbar
set guioptions-=L " Remove left scroll bar for vertically split windoww
set guioptions-=r " Remove right scrollbar
set guioptions-=R " Remove right scrollbar for vertically split windows
set guioptions-=b " Remove bottom scrollbar

" Toggle GUI Display
function! ToggleGUI()
	if &guioptions == ""
		set guioptions=m
	else
		set guioptions=
	endif
endfunction!
if has("win32")
	nnoremap <Leader>tg :call ToggleGUI()<CR>
endif

" Disable alt-key menu access.
set wak=no

" Use C-Space for command-line completion
function! CommandLineCompletion()
	call feedkeys("\<Nul>", "t")
	return ""
endfunction
cmap <expr> <C-space> CommandLineCompletion()
