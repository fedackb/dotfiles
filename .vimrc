" Platform-Dependent Settings
let $VIMHOME = has('win32') ? $HOME . '\vimfiles' : $HOME . '/.vim'
let $MAKECMD = has('win32') ? 'mingw32-make.exe' : 'make'

" Paths
set runtimepath+=$VIMHOME/vim-plug

" Plugins
call plug#begin($VIMHOME . '/vim-plug/plugins')
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do' : $MAKECMD}
Plug 'beloglazov/vim-online-thesaurus'
Plug 'dansomething/vim-eclim'
Plug 'davidhalter/jedi-vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

" General Options
filetype indent on
let g:mapleader = ','
let g:maplocalleader = g:mapleader
set autoindent
set nosmartindent
set cindent
set backspace=2
set noexpandtab
set shiftwidth=3
set softtabstop=3
set tabstop=3
set nocursorcolumn
set cursorline
set foldlevelstart=99
set foldmethod=syntax
set number
set relativenumber
set autoread
set clipboard=unnamed,unnamedplus
set complete=.
set completeopt=menu,menuone,longest
set encoding=utf-8
set incsearch
set listchars=trail:·,precedes:«,extends:»,eol:¶,tab:▸\ "
set mouse=a
set nolist
set nowrap
set pumheight=5
set title
set ruler
set scrolloff=0
set sidescroll=1
set selection=inclusive
set showcmd
set spell
set splitbelow
set splitright
set wildchar=<Tab>
set wildcharm=<Tab>
set wildmode=list:longest:full
set t_Co=256
set t_RV=
set t_ut=
set nobackup
set nocompatible
set noswapfile
set viminfo=
syn on

" Disable recording.
nnoremap q <Nop>

" Disable Ex mode.
nnoremap Q <Nop>

" Cursor Helpers
nnoremap j gj
nnoremap k gk

" Buffer Browser
nnoremap <Leader>b :buffers<CR>:buffer<Space>

" File Browser
nnoremap <Leader>e :e %:p:h/<Tab>

" Search
nnoremap / /\v\c
nnoremap ? ?\v\c

" Search & Replace
nnoremap <Leader>s :.,$s/\V\<<C-r><C-w>\>//gc<Left><Left><Left>
nnoremap <Leader>S :.,$s/\V<C-r><C-a>//gc<Left><Left><Left>
vnoremap <Leader>s y:.,$s/\V<C-r>0//gc<Left><Left><Left>

" Cycle through Line Number Display Modes
function! CycleNumberDisplay()
	if !&number              " Display absolute line numbers.
		set number
	elseif !&relativenumber  " Display relative line numbers.
		set relativenumber
	else                     " Hide line numbers.
		set nonumber
		set norelativenumber
	endif
endfunction
nnoremap <Leader>t1 :call CycleNumberDisplay()<CR>

" Folding
function! FoldText()
	let text = getline(v:foldstart)
	let text = substitute(text, '\t', repeat(' ', &tabstop), 'g')
	let text = text . repeat(' ', 350)
	return text
endfunction
set foldtext=FoldText()
nnoremap <silent> <Space> za

" Tags
set tags+=./tags;
nnoremap <C-F12> :!ctags -R .<CR>

if has('autocmd')
	augroup OneDark
		if exists("onedark#extend_highlight")
			autocmd!
			autocmd ColorScheme * call onedark#extend_highlight('StatusLine', {'bg': {'cterm': 234}})
			autocmd ColorScheme * call onedark#extend_highlight('StatusLineNC', {'bg': {'cterm': 234}})
			autocmd ColorScheme * call onedark#extend_highlight('TabLine', {'bg': {'cterm': 234}, 'fg': {'cterm': 59}})
			autocmd ColorScheme * call onedark#extend_highlight('TabLineFill', {'bg': {'cterm': 234}})
			autocmd ColorScheme * call onedark#extend_highlight('VertSplit', {'bg': {'cterm': 234}, 'fg': {'cterm': 234}})
		endif
	augroup END

	" C/C++
	augroup C/C++
		autocmd!
		autocmd FileType c setlocal tags+=$VIMHOME/tags/c.tags
		autocmd FileType cpp setlocal tags+=$VIMHOME/tags/cpp.tags
	augroup END

	" HTML/XML
	augroup HTML/XML
		autocmd!
		autocmd FileType html,xml,xsd setlocal noexpandtab shiftwidth=2 softtabstop=2 tabstop=2
	augroup END
	vnoremap <Leader>he :s/\m\%V[<>]/\={'<':'&lt;','>':'&gt;'}[submatch(0)]/g<CR>

	" Java
	augroup Java
		autocmd!
		autocmd FileType java setlocal tags+=$VIMHOME/tags/java.tags
	augroup END

	" PHP
	augroup PHP
		autocmd!
		autocmd FileType php setlocal noexpandtab shiftwidth=4 softtabstop=4 tabstop=4
	augroup END

	" Python
	augroup Python
		autocmd!
		autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
														\        foldmethod=indent
	augroup END

	" Text
	augroup Text
		autocmd!
		autocmd FileType text setlocal wrap linebreak expandtab shiftwidth=2 softtabstop=2 tabstop=2
	augroup END

	" TypeScript
	augroup TypeScript
		autocmd!
		autocmd FileType typescript nnoremap <buffer> <Leader>tt :<C-u>echo tsuquyomi#hint()<CR>
	augroup END

	" Vim Config
	augroup vimrc
		autocmd!
		autocmd FileType vim setlocal noexpandtab shiftwidth=3 softtabstop=3 tabstop=3
		autocmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc source $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
	augroup END

	" Omni Complete
	augroup OmniComplete
		autocmd!
		autocmd FileType c,cpp         setlocal omnifunc=omni#cpp#complete#Main
		autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
		autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
		autocmd FileType java          setlocal omnifunc=syntaxcomplete#Complete
		autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
		autocmd FileType php           setlocal omnifunc=phpcomplete#CompletePHP
		autocmd FileType xml,xsd       setlocal omnifunc=xmlcomplete#CompleteTags
		autocmd FileType sql           setlocal omnifunc=sqlcomplete#Complete
	augroup END

	" Miscellaneous
	augroup Misc
		autocmd!
		autocmd VimEnter * set vb t_vb= " Removes bells
		autocmd VimEnter * hi clear SpellBad
		autocmd VimEnter * hi SpellBad ctermfg=red cterm=underline,bold gui=underline
	augroup END
	function! Strip() " Removes trailing whitespaces
		:%s/\s\+$//e
	endfunction
endif

" Color Scheme
colorscheme palenight

function! Autocomplete()
	let expr = ''

	" Insert a tab if at the front of the current line.
	if strpart(getline('.'), 0, col('.') - 1) =~ '^[ \t]*$'
		let expr .= "\<Tab>"

	" Otherwise, invoke a completion method.
	else
		" Ensure that the popup menu is closed.
		let expr = pumvisible() ? "\<C-e>" : ''

		" Determine if user completion matches exist.
		let userMatchesExist = 0
		if exists('&completefunc') && &completefunc != ''
			let Fn = function(&completefunc)
			let start = Fn(1, '')
			let base = strpart(getline('.'), start, col('.') - start - 1)
			let userMatchesExist = !empty(Fn(0, base))
		endif

		" Invoke user completion if at least one match exists.
		if userMatchesExist
			let expr .= "\<C-x>\<C-u>\<C-r>=pumvisible() ? " .
			\           "\"\\<Down>\" : \"\"" .
			\           "\<CR>"
		else
			" Determine if omni completion matches exist.
			let omniMatchesExist = 0
			if exists('&omnifunc') && &omnifunc != ''
				let Fn = function(&omnifunc)
				let start = Fn(1, '')
				let base = strpart(getline('.'), start, col('.') - start - 1)
				let omniMatchesExist = !empty(Fn(0, base))
			endif

			" Invoke omni completion if at least one match exists.
			if omniMatchesExist
				let expr .= "\<C-x>\<C-o>\<C-r>=pumvisible() ? " .
				\           "\"\\<Down>\" : \"\"" .
				\           "\<CR>"
			else
				" Invoke keyword completion.
				let expr .= "\<C-n>\<C-r>=pumvisible() ? " .
				\           "\"\\<Down>\" : \"\"" .
				\           "\<CR>"
			endif
		endif
	endif
	return expr
endfunction
inoremap <expr> <silent> <Tab> AutoComplete()
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <C-Space> <Tab>
inoremap <Nul> <Tab>

" Toggle Commands
function! ToggleMargin()
	if !&colorcolumn
		let &colorcolumn = join(range(80,334), ',')
	else
		let &colorcolumn = ''
	endif
endfunction
function! ToggleWinMinMax()
	if exists('g:windowIsMaximized') && g:windowIsMaximized
		let g:windowIsMaximized = 0
		return "\<C-w>="
	else
		let g:windowIsMaximized = 1
		return "\<C-w>\<Bar>\<C-w>_"
	endif
endfunction
nnoremap <Leader>tc :let &scrolloff = 999-&scrolloff<CR>
nnoremap <Leader>th :set hlsearch!<CR>
nnoremap <Leader>tl :set list!<CR>
nnoremap <Leader>tm :call ToggleMargin()<CR>
nnoremap <Leader>ts :set spell!<CR>:set spell?<CR>
nnoremap <Leader>tb :TagbarToggle<CR>
nnoremap <expr> <C-m> ToggleWinMinMax()

" Ctrl-p
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cache_dir = $VIMHOME . '/cache/ctrlp'
let g:ctrlp_show_hidden = 0
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]\.(git|cache|tmp|__init__)$', 'file': '\v\.(o|pyc|swp|zip|exe|so|dll|dat|DS_Store|NTUSER|ntuser|LOG1|LOG2|png|bmp|jpg)$' }

" Easy Align
vmap <Enter> <Plug>(EasyAlign)

" Jedi Vim
let g:jedi#show_call_signatures = 0

" Multiple Cursors
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<C-[>'
function! Multiple_cursors_before()
	if exists(':NeoCompleteLock') == 2
		exe 'NeoCompleteLock'
	endif
endfunction
function! Multiple_cursors_after()
	if exists(':NeoCompleteUnlock') == 2
		exe 'NeoCompleteUnlock'
	endif
endfunction

" NERDCommenter
let g:NERDSpaceDelims = 1

" NERDTree
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeIgnore = ['\~$', '\.pyc$', 'NTUSER', 'ntuser']
let g:NERDTreeShowLineNumbers = 1
augroup NERDTree
	autocmd!
	autocmd FileType nerdtree setlocal relativenumber
augroup END

" netrw
let g:netrw_banner = 0
let netrw_liststyle = 0
augroup netrw
	autocmd!
	autocmd FileType netrw let netrw_bufsettings += 'number'
	autocmd FileType netrw nnoremap <buffer> <nowait> <silent> q :bd!<CR>
augroup END

" OmniCppComplete
let OmniCpp_SelectFirstItem = 2
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1

" Table Mode
let g:table_mode_corner = '|'
let g:table_mode_map_prefix = '\t'
let g:table_mode_realign_map = g:table_mode_map_prefix . 'r'
let g:table_mode_delete_row_map = g:table_mode_map_prefix . 'dd'
let g:table_mode_delete_column_map = g:table_mode_map_prefix . 'dc'
let g:table_mode_add_formula_map = g:table_mode_map_prefix . 'fa'
let g:table_mode_eval_formula_map = g:table_mode_map_prefix . 'fe'
let g:table_mode_echo_cell_map = g:table_mode_map_prefix . '?'
let g:table_mode_sort_map = g:table_mode_map_prefix . 's'

" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_show_linenumbers = 2

" UltiSnips
let g:UltiSnipsNoPythonWarning = 1
let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsExpandTrigger = '<C-a>'
let g:UltiSnipsJumpForwardTrigger = '<C-f>'
let g:UltiSnipsJumpBackwardTrigger = '<C-b>'
let g:UltiSnipsListSnippets = '<C-l>'

" Tsuquyomi Typescript
let g:tsuquyomi_completion_detail = 0
