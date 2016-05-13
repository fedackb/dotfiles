" Platform-Dependent Settings
let $VIMHOME = has('win32') ? $HOME . '\\vimfiles' : $HOME . '/.vim'
let &term = has('win32') ? 'win32' : 'xterm-256color'

" Paths
set runtimepath+=$VIMHOME
set runtimepath+=$VIMHOME/plugins/Vundle.vim

" Plugins
set nocompatible
filetype off
call vundle#begin($VIMHOME . '/plugins/')
Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'SirVer/ultisnips'
Plugin 'dansomething/vim-eclim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/vim-easy-align'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/OmniCppComplete'
call vundle#end()
filetype plugin indent on

" Color Scheme
colorscheme molokai

" General Options
let g:mapleader = ','
set autoindent
set autoread
set backspace=2
set clipboard=unnamed,unnamedplus
set complete-=i
set completeopt=menu,menuone,longest
set cursorcolumn
set cursorline
set encoding=utf-8
set foldlevelstart=99
set foldmethod=syntax
set incsearch
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\ "
set mouse=
set nobackup
set nocompatible
set noexpandtab
set nolist
set noswapfile
set nowrap
set number
set pumheight=10
set relativenumber
set ruler
set scrolloff=0
set selection=inclusive
set shiftwidth=4
set showcmd
set softtabstop=4
set spell
set splitbelow
set splitright
set t_Co=256
set t_RV=
set t_ut=
set tabstop=4
set viminfo=
set wildchar=<Nul>
set wildmode=longest,list
syn on

" Disable case changing.
vnoremap u <Nul>
vnoremap <S-u> <Nul>
nnoremap guu <Nul>
nnoremap gUU <Nul>
vnoremap gu <Nul>
vnoremap gU <Nul>

" Disable recording.
nnoremap q <Nul>

" Disable Ex mode.
nnoremap Q <Nul>

" Disable fast exit.
nnoremap ZZ <Nul>

" Convenience Mappings
nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

" Cursor Helpers
nnoremap j gj
nnoremap k gk

" Search & Replace
nnoremap <Leader>s :%s/\<C-r><C-w>/

" Surrounds
noremap <Leader>+ :s/^\(\s*\)\(.*\)$/\1'\2 ' \+/<CR>
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
nnoremap <Leader>ye ^yg_:<C-r>"<CR>

" Folding
function! FoldText()
	let text =  getline(v:foldstart)
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

" HTML
augroup HTML
	autocmd!
	autocmd FileType html setlocal noexpandtab shiftwidth=2 softtabstop=2 tabstop=2
augroup END
vnoremap <Leader>he :s/\%V[<>]/\={'<':'&lt;','>':'&gt;'}[submatch(0)]/g<CR>

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

" Vim Config
augroup vimrc
	autocmd!
	autocmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
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
nnoremap <Leader>tt :TagbarToggle<CR>
nnoremap <expr> <C-m> ToggleWinMinMax()

" Omnicomplete
augroup omnicomplete
	autocmd!
	autocmd FileType c,cpp         let &l:omnifunc = exists(':Eclim') && eclim#EclimAvailable() ? 'eclim#c#complete#CodeComplete' : 'omni#cpp#complete#Main'
	autocmd FileType css           let &l:omnifunc = exists(':Eclim') && eclim#EclimAvailable() ? 'eclim#css#complete#CodeComplete' : 'csscomplete#CompleteCSS'
	autocmd FileType html,markdown let &l:omnifunc = exists(':Eclim') && eclim#EclimAvailable() ? 'eclim#html#complete#CodeComplete' : 'htmlcomplete#CompleteTags'
	autocmd FileType java          let &l:omnifunc = exists(':Eclim') && eclim#EclimAvailable() ? 'eclim#java#complete#CodeComplete' : 'syntaxcomplete#Complete'
	autocmd FileType javascript    let &l:omnifunc = exists(':Eclim') && eclim#EclimAvailable() ? 'eclim#javascript#complete#CodeComplete' : 'javascriptcomplete#CompleteJS'
	autocmd FileType php           let &l:omnifunc = exists(':Eclim') && eclim#EclimAvailable() ? 'eclim#php#complete#CodeComplete' : 'phpcomplete#CompletePHP'
	autocmd FileType python        let &l:omnifunc = exists(':Eclim') && eclim#EclimAvailable() ? 'eclim#python#complete#CodeComplete' : 'jedi#completions'
	autocmd FileType xml           let &l:omnifunc = exists(':Eclim') && eclim#EclimAvailable() ? 'eclim#xml#complete#CodeComplete' : 'xmlcomplete#CompleteTags'
	autocmd FileType sql           setlocal omnifunc=sqlcomplete#Complete
	autocmd FileType *             if &l:omnifunc == '' | setlocal omnifunc=syntaxcomplete#Complete | endif
augroup END
inoremap <Nul> <C-x><C-o><C-n>
inoremap <C-space> <C-x><C-o><C-n>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <BS>  pumvisible() ? "\<C-e>\<C-h>" : "\<C-h>"
inoremap <expr> <C-h> pumvisible() ? "\<C-e>\<C-h>" : "\<C-h>"

" Miscellaneous
augroup Misc
	autocmd!
	autocmd VimEnter * set vb t_vb= " Removes bells
	autocmd VimEnter * hi SpellBad cterm = underline

	" Remove trailing whitespaces.
	function! Strip()
		:%s/\s\+$//e
	endfunction
augroup END

" Ctrl-p
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cache_dir = $VIMHOME . '/cache/ctrlp'
let g:ctrlp_show_hidden = 0
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|cache|tmp|__init__)$',
	\ 'file': '\v\.(o|pyc|swp|zip|exe|so|dll|dat|DS_Store|NTUSER|ntuser|LOG1|LOG2|png|bmp|jpg)$'
	\ }

" Easy Align
vmap <Enter> <Plug>(EasyAlign)

" Eclim
let g:EclimCompletionMethod = 'omnifunc'

" Multiple Cursors
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = "<C-n>"
let g:multi_cursor_prev_key = "<C-p>"
let g:multi_cursor_skip_key = "<C-x>"
let g:multi_cursor_quit_key = "<C-c>"
function! Multiple_cursors_before()
	if exists(':NeoCompleteLock') == 2
		exe 'NeoCompleteLock'
	endif
endfunction
function! Multiple_cursors_after()
	if exists(':NeoCompleteUnlock')==2
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
nnoremap <Leader>e :execute "e %:p:h"<CR>

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
let g:UltiSnipsExpandTrigger = "<C-a>"
let g:UltiSnipsJumpForwardTrigger = "<C-f>"
let g:UltiSnipsJumpBackwardTrigger = "<C-b>"
let g:UltiSnipsListSnippets = "<C-l>"
