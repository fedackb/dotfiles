" Platform-Dependent Settings
let $VIMHOME = has('win32') ? $HOME . '\vimfiles' : $HOME . '/.vim'
let $MAKECMD = has('win32') ? 'mingw32-make.exe' : 'make'

" Paths
set runtimepath+=$VIMHOME/vim-plug

" Plugins
call plug#begin($VIMHOME . '/vim-plug/plugins')
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do' : $MAKECMD}
Plug 'davidhalter/jedi-vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'jnurmine/Zenburn'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

" Color Scheme
colorscheme onedark

" General Options
filetype indent on
let g:mapleader = ','
set autoindent
set smartindent
set ignorecase
set smartcase
set backspace=2
set noexpandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set cursorcolumn
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
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\ "
set mouse=
set nolist
set nowrap
set pumheight=10
set ruler
set scrolloff=0
set selection=inclusive
set showcmd
set spell
set splitbelow
set splitright
set wildchar=<Tab>
set wildmode=list:longest
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

" Convenience Mappings
inoremap jj <Esc>
nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

" Cursor Helpers
nnoremap j gj
nnoremap k gk

" File Browser
nnoremap <Leader>e :e %:p:h<CR>

" Search
nnoremap / /\v

" Search & Replace
nnoremap <Leader>s :.,$s/\V\<<C-r><C-w>\>//gc<Left><Left><Left>
nnoremap <Leader>S :.,$s/\V<C-r><C-a>//gc<Left><Left><Left>
vnoremap <Leader>s y:.,$s/\V<C-r>0//gc<Left><Left><Left>

" Surrounds
noremap  <Leader>+ :s/\v^(\s*)(.*)$/\1'\2' \+/<CR>
nnoremap <Leader>` ciW``<Esc>P
nnoremap <Leader>" ciW""<Esc>P
nnoremap <Leader>' ciW''<Esc>P
nnoremap <Leader>{ ciW{}<Esc>P
nnoremap <Leader>( ciW()<Esc>P
nnoremap <Leader>< ciW<><Esc>P
nnoremap <Leader>[ ciW[]<Esc>P
vnoremap <Leader>` c``<Esc>P
vnoremap <Leader>" c""<Esc>P
vnoremap <Leader>' c''<Esc>P
vnoremap <Leader>{ c{}<Esc>P
vnoremap <Leader>( c()<Esc>P
vnoremap <Leader>< c<><Esc>P
vnoremap <Leader>[ c[]<Esc>P

" Current Working Directory
nnoremap <Leader>cd :lcd %:p:h<CR>:pwd<CR>

" Cycle through Line Number Display Modes
function! CycleNumberDisplay()
	if !&number              " Display absolute line numbers.
		set number
	elseif !&relativenumber  " Display relative line numbers.
		set relativenumber
	else                     " Hide line numbers.
		set number!
		set relativenumber!
	endif
endfunction
nnoremap <Leader>t1 :call CycleNumberDisplay()<CR>

" Yanks
noremap <S-y> y$
nnoremap <Leader>y ^yg_:<C-r>"<CR>

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
augroup END

" Text
augroup text
	autocmd!
	autocmd FileType text setlocal wrap linebreak expandtab shiftwidth=2 softtabstop=2 tabstop=2
augroup END

" Typescript
augroup typescript
	autocmd!
	autocmd FileType typescript nnoremap <buffer> <Leader>tt :<C-u>echo tsuquyomi#hint()<CR>
augroup END

" Vim Config
augroup vimrc
	autocmd!
	autocmd FileType vim setlocal shiftwidth=2 softtabstop=2 tabstop=2
	autocmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

function! Autocomplete()
	let expr = ""

	" Insert a tab if at the front of the current line.
	if strpart(getline("."), 0, col(".") - 1) =~ "^\s*$"
		let expr .= "\<Tab>"

	" Otherwise, invoke a completion method.
	else
		" Ensure that the popup menu is closed.
		let expr = pumvisible() ? "\<C-e>" : ""

		" Determine if omni completion matches exist.
		let omniMatchesExist = 0
		if exists("&omnifunc") && &omnifunc != ""
			let F = function(&omnifunc)
			let start = F(1, "")
			let base = strpart(getline("."), start, col(".") - start - 1)
			let omniMatchesExist = !empty(F(0, base))
		endif

		" Invoke omni completion if at least one match exists.
		if omniMatchesExist
			let expr .= "\<C-x>\<C-o>\<C-r>=pumvisible() ? " .
			\           "\"\\<Down>\" : \"\"" .
			\           "\<CR>"

		" Otherwise, invoke keyword completion.
		else
			let expr .= "\<C-n>\<C-r>=pumvisible() ? " .
			\           "\"\\<Down>\" : \"\"" .
			\           "\<CR>"
		endif
	endif
	return expr
endfunction
inoremap <expr> <silent> <Tab> Autocomplete()
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <C-Space> <Tab>
inoremap <Nul> <Tab>

" Omni Complete
augroup omnicomplete
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

" Toggle Commands
function! ToggleMargin()
	if !&colorcolumn
		let &colorcolumn = join(range(80,334), ',')
	else
		let &colorcolumn = ""
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

" Ctrl-p
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cache_dir = $VIMHOME . '/cache/ctrlp'
let g:ctrlp_show_hidden = 0
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]\.(git|cache|tmp|__init__)$', 'file': '\v\.(o|pyc|swp|zip|exe|so|dll|dat|DS_Store|NTUSER|ntuser|LOG1|LOG2|png|bmp|jpg)$' }

" Easy Align
vmap <Enter> <Plug>(EasyAlign)

" Eclim
let g:EclimCompletionMethod = 'omnifunc'

" Multiple Cursors
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<C-c>'
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
