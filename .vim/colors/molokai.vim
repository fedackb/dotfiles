" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
" https://github.com/tomasr/molokai
"
" Note: Based on the Monokai theme for TextMate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
"

hi clear

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="molokai"

if exists("g:molokai_original")
    let s:molokai_original = g:molokai_original
else
    let s:molokai_original = 0
endif
if has("gui_running")
	set background=dark
endif


hi Boolean         guifg=#AF5FFF
hi Character       guifg=#DFDF87
hi Number          guifg=#AF5FFF
hi String          guifg=#DFDF87
hi Conditional     guifg=#F92672               gui=bold
hi Constant        guifg=#AF5FFF               gui=bold
hi Cursor          guifg=#000000 guibg=#F8F8F0
hi iCursor         guifg=#000000 guibg=#F8F8F0
hi Debug           guifg=#BCA3A3               gui=bold
hi Define          guifg=#5FD7FF
hi Delimiter       guifg=#8F8F8F
hi DiffAdd                       guibg=#13354A
hi DiffChange      guifg=#89807D guibg=#4C4745
hi DiffDelete      guifg=#960050 guibg=#1E0010
hi DiffText                      guibg=#4C4745 gui=italic,bold

hi Directory       guifg=#00D787               gui=bold
hi Error           guifg=#DFDF87 guibg=#1E0010
hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold
hi Exception       guifg=#00D787               gui=bold
hi Float           guifg=#AF5FFF
hi FoldColumn      guifg=#465457 guibg=#000000
hi Folded          guifg=#465457 guibg=#1C1C1C
hi Function        guifg=#00D787
hi Identifier      guifg=#FF875F
hi Ignore          guifg=#808080 guibg=bg
hi IncSearch                                   gui=reverse

hi Keyword         guifg=#F92672               gui=bold
hi Label           guifg=#DFDF87               gui=none
hi Macro           guifg=#C4BE89               gui=italic
hi SpecialKey      guifg=#5FD7FF               gui=italic

hi MatchParen      guifg=#FF875F guibg=bg      gui=bold
hi ModeMsg         guifg=#DFDF87
hi MoreMsg         guifg=#DFDF87
hi Operator        guifg=#F92672

" complete menu
hi Pmenu           guifg=#D0D0D0 guibg=#303030
hi PmenuSel        guifg=#FF875F guibg=#303030
hi PmenuSbar                     guibg=#4E4E4E
hi PmenuThumb                    guibg=#6C6C6C

hi PreCondit       guifg=#00D787               gui=bold
hi PreProc         guifg=#00D787
hi Question        guifg=#5FD7FF
hi Repeat          guifg=#F92672               gui=bold
hi Search          guifg=#000000 guibg=#FFE792
" marks
hi SignColumn      guifg=#00D787 guibg=#232526
hi SpecialChar     guifg=#F92672               gui=bold
hi SpecialComment  guifg=#7E8E91               gui=bold
hi Special         guifg=#5FD7FF guibg=bg      gui=italic
if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif
hi Statement       guifg=#F92672               gui=bold
hi StatusLine      guifg=#455354 guibg=fg
hi StatusLineNC    guifg=#808080 guibg=#080808
hi StorageClass    guifg=#FF875F               gui=italic
hi Structure       guifg=#5FD7FF
hi Tag             guifg=#F92672               gui=italic
hi Title           guifg=#ef5939
hi Todo            guifg=#FFFFFF guibg=bg      gui=bold

hi Typedef         guifg=#5FD7FF
hi Type            guifg=#5FD7FF               gui=none
hi Underlined      guifg=#808080               gui=underline

hi VertSplit       guifg=#808080 guibg=#080808 gui=bold
hi VisualNOS                     guibg=#403D3D
hi Visual          guifg=#FFFFDF guibg=#444444

hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
hi WildMenu        guifg=#5FD7FF guibg=#000000

hi TabLineFill     guifg=#262626 guibg=#262626
hi TabLine         guibg=#262626 guifg=#808080 gui=none

hi ColorColumn                   guibg=#1C1C1C
hi Comment         guifg=#7E8E91
hi CursorColumn                  guibg=#303030
hi CursorLine                    guibg=#303030
hi CursorLineNr    guifg=#FF875F guibg=#3A3A3A
hi LineNr          guifg=#D0D0D0 guibg=#3A3A3A
hi NonText         guifg=#465457
hi Normal          guifg=#D0D0D0 guibg=#262626
hi SpecialKey      guifg=#465457

"
" Support for 256-color terminal
"
if &t_Co > 255
	hi Normal          ctermfg=252  ctermbg=235
	hi Comment         ctermfg=244
	hi LineNr          ctermfg=252  ctermbg=237
	hi NonText         ctermfg=59
	hi CursorLine      ctermfg=none ctermbg=236   cterm=none
	hi CursorLineNr    ctermfg=209  ctermbg=237   cterm=bold
	hi CursorColumn                 ctermbg=236   cterm=none
	hi ColorColumn                  ctermbg=234   cterm=none

	hi Boolean         ctermfg=135
	hi Character       ctermfg=186
	hi Number          ctermfg=135
	hi String          ctermfg=186

	hi Constant        ctermfg=135                cterm=bold
	hi Conditional     ctermfg=161                cterm=none
	hi Cursor          ctermfg=none ctermbg=none  cterm=reverse
	hi Debug           ctermfg=225                cterm=bold
	" hi Define          ctermfg=81
	hi Delimiter       ctermfg=241

	hi DiffAdd                      ctermbg=24
	hi DiffChange      ctermfg=181  ctermbg=239
	hi DiffDelete      ctermfg=162  ctermbg=53
	hi DiffText                     ctermbg=102   cterm=bold

	hi Directory       ctermfg=42                cterm=bold
	hi Error           ctermfg=219  ctermbg=89
	hi ErrorMsg        ctermfg=209  ctermbg=236  cterm=bold
	hi Exception       ctermfg=42                cterm=bold
	hi Float           ctermfg=135
	hi FoldColumn      ctermfg=67   ctermbg=16
	hi Folded          ctermfg=67   ctermbg=234
	hi Function        ctermfg=42
	hi Identifier      ctermfg=209                cterm=none
	hi Ignore          ctermfg=244  ctermbg=232
	hi IncSearch       ctermfg=none ctermbg=none  cterm=reverse

	hi keyword         ctermfg=161                cterm=bold
	hi Label           ctermfg=229                cterm=none
	hi SpecialKey      ctermfg=81

	hi MatchParen      ctermfg=209  ctermbg=none  cterm=bold
	hi ModeMsg         ctermfg=229
	hi MoreMsg         ctermfg=229
	hi Operator        ctermfg=209

	" complete menu
	hi Pmenu           ctermfg=252  ctermbg=236
	hi PmenuSel        ctermfg=209  ctermbg=236
	hi PmenuSbar                    ctermbg=238
	hi PmenuThumb                   ctermbg=242

	hi PreCondit       ctermfg=42                cterm=bold
	hi PreProc         ctermfg=42
	hi Question        ctermfg=81
	hi Repeat          ctermfg=161                cterm=bold
	hi Search          ctermfg=0    ctermbg=222   cterm=NONE

	" marks column
	hi SignColumn      ctermfg=42   ctermbg=235
	hi SpecialChar     ctermfg=161                cterm=bold
	hi SpecialComment  ctermfg=245                cterm=bold
	hi Special         ctermfg=81
	if has("spell")
		hi SpellBad                 ctermbg=52
		hi SpellCap                 ctermbg=17
		hi SpellLocal               ctermbg=17
		hi SpellRare   ctermfg=none ctermbg=none  cterm=reverse
	endif
	hi Statement       ctermfg=161                cterm=bold
	hi StatusLine      ctermfg=238  ctermbg=253
	hi StatusLineNC    ctermfg=244  ctermbg=232
	hi StorageClass    ctermfg=209
	hi Structure       ctermfg=81
	hi Tag             ctermfg=161
	hi Title           ctermfg=166
	hi Todo            ctermfg=231  ctermbg=232   cterm=bold

	hi Typedef         ctermfg=81
	hi Type            ctermfg=81                 cterm=none
	hi Underlined      ctermfg=244                cterm=underline

	hi VertSplit       ctermfg=244  ctermbg=232   cterm=bold
	hi VisualNOS                    ctermbg=238
	hi Visual          ctermfg=230  ctermbg=238   cterm=none
	hi WarningMsg      ctermfg=231  ctermbg=238   cterm=bold
	hi WildMnu        ctermfg=81   ctermbg=16

	hi SpecialKey      ctermfg=59

	hi TabLine         ctermfg=244  ctermbg=233   cterm=none
	hi TabLineSel      ctermfg=230  ctermbg=235   cterm=none
	hi TabLineFill     ctermfg=none ctermbg=234   cterm=none

	hi Include         ctermfg=161  ctermbg=none  cterm=none guifg=#F92672 
	hi Define          ctermfg=161  ctermbg=none  cterm=none guifg=#F92672
	hi Defined         ctermfg=209  ctermbg=none  cterm=none guifg=#FF875F
end
