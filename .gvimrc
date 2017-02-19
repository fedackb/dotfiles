" Font
if has('win32')
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
set guioptions-=e " Remove GUI tabs

" Toggles GUI display
if has('win32')
	function! ToggleGUI()
		if &guioptions == ''
			set guioptions=m
		else
			set guioptions=
		endif
	endfunction!
	nnoremap <Leader>tg :call ToggleGUI()<CR>
endif

" Toggles fullscreen
if !has('win32')
	function! ToggleFullscreen()
		let cmd = 'wmctrl -ir ' . v:windowid . ' -b toggle,fullscreen'
		:call system(cmd)
		:redraw!
	endfunction
	map <silent> <expr> <F11> ToggleFullscreen()
endif

" Disable alt-key menu access.
set wak=no
