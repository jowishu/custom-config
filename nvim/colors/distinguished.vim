" Author: Kim Silkebækken <kim.silkebaekken+vim@gmail.com>
" Source repository: https://github.com/Lokaltog/vim-distinguished

" Initialization {{{
	set background=dark

	hi clear
	if exists('syntax_on')
		syntax reset
	endif

	let g:colors_name = 'distinguished'

	if ! has('gui_running')
		if &t_Co != 256
			echoe 'The ' . g:colors_name . ' color scheme requires gvim or a 256-color terminal'

			finish
		endif
	endif
" }}}
" Color dictionary parser {{{
	function! s:ColorDictParser(color_dict)
		for [group, group_colors] in items(a:color_dict)
			exec 'hi ' . group
				\ . ' ctermfg=' . (group_colors[0] == '' ? 'NONE' :       group_colors[0])
				\ . ' ctermbg=' . (group_colors[1] == '' ? 'NONE' :       group_colors[1])
				\ . '   cterm=' . (group_colors[2] == '' ? 'NONE' :       group_colors[2])
				\
				\ . '   guifg=' . (group_colors[3] == '' ? 'NONE' : '#' . group_colors[3])
				\ . '   guibg=' . (group_colors[4] == '' ? 'NONE' : '#' . group_colors[4])
				\ . '     gui=' . (group_colors[5] == '' ? 'NONE' :       group_colors[5])
		endfor
	endfunction
" }}}

"	   | Highlight group                |  CTFG |  CTBG |    CTAttributes | || |   GUIFG |    GUIBG |   GUIAttributes |
"	   |--------------------------------|-------|-------|-----------------| || |---------|----------|-----------------|
call s:ColorDictParser({
	\   'Normal'                      : [    231,     16,               '',      'ffffff',  '000000',               '']
	\ , 'Visual'                      : [    240,    253,               '',      '585858',  'dadada',               '']
	\
	\ , 'Cursor'                      : [     '',     '',               '',      'ffffff',  'dd4010',               '']
	\ , 'lCursor'                     : [     '',     '',               '',      'ffffff',  '89b6e2',               '']
	\
	\ , 'CursorLine'                  : [     '',    236,               '',            '',  '3a3a3a',               '']
	\ , 'CursorLineNr'                : [    231,    240,               '',      'ffffff',  '585858',               '']
	\ , 'CursorColumn'                : [    231,    237,               '',      'ffffff',  '3a3a3a',               '']
	\
	\ , 'Folded'                      : [    249,    234,               '',      'b2b2b2',  '1c1c1c',               '']
	\ , 'FoldColumn'                  : [    243,    234,               '',      '767676',  '1c1c1c',               '']
	\ , 'SignColumn'                  : [    231,    233,           'bold',      'ffffff',  '121212',           'bold']
	\ , 'ColorColumn'                 : [      '',   233,               '',            '',  '262626',               '']
	\
	\ , 'StatusLine'                  : [    231,    236,           'bold',      'ffffff',  '303030',           'bold']
	\ , 'StatusLineNC'                : [    244,    232,               '',      '808080',  '080808',               '']
	\
	\ , 'LineNr'                      : [    243,    235,               '',      '767676',  '262626',               '']
	\ , 'VertSplit'                   : [    240,     '',               '',      '585858',  '1c1c1c',               '']
	\
	\ , 'WildMenu'                    : [    234,    231,               '',      '1c1c1c',  'ffffff',               '']
	\ , 'Directory'                   : [    143,     '',           'bold',      'afaf5f',        '',           'bold']
	\ , 'Underlined'                  : [    130,     '',               '',      'af5f00',        '',               '']
	\
	\ , 'Question'                    : [     74,     '',           'bold',      '5fafd7',        '',           'bold']
	\ , 'MoreMsg'                     : [    214,     '',           'bold',      'ffaf00',        '',           'bold']
	\ , 'WarningMsg'                  : [    202,     '',           'bold',      'ff5f00',        '',           'bold']
	\ , 'ErrorMsg'                    : [    196,     '',           'bold',      'ff0000',        '',           'bold']
	\
	\ , 'Comment'                     : [    243,    233,               '',      '767676',  '121212',               '']
	\ , 'vimCommentTitleLeader'       : [    250,    233,               '',      'bcbcbc',  '121212',               '']
	\ , 'vimCommentTitle'             : [    250,    233,               '',      'bcbcbc',  '121212',               '']
	\ , 'vimCommentString'            : [    245,    233,               '',      '8a8a8a',  '121212',               '']
	\
	\ , 'TabLine'                     : [    231,    238,               '',      'ffffff',  '444444',               '']
	\ , 'TabLineSel'                  : [    255,     '',           'bold',      'eeeeee',        '',           'bold']
	\ , 'TabLineFill'                 : [    240,    238,               '',      '585858',  '444444',               '']
	\ , 'TabLineNumber'               : [    160,    238,           'bold',      'd70000',  '444444',           'bold']
	\ , 'TabLineClose'                : [    245,    238,           'bold',      '8a8a8a',  '444444',           'bold']
	\
	\ , 'SpellCap'                    : [    231,     31,           'bold',      'ffffff',  '0087af',           'bold']
	\
	\ , 'SpecialKey'                  : [    239,     '',               '',      '4e4e4e',        '',               '']
	\ , 'NonText'                     : [     88,     '',               '',      '870000',        '',               '']
	\ , 'MatchParen'                  : [    231,     25,           'bold',      'ffffff',  '005faf',           'bold']
	\
	\ , 'Constant'                    : [    137,     '',           'bold',      'af875f',        '',           'bold']
	\ , 'Special'                     : [    150,     '',               '',      'afd787',        '',               '']
	\ , 'Identifier'                  : [     66,     '',           'bold',      '5f8787',        '',           'bold']
	\ , 'Statement'                   : [    186,     '',           'bold',      'd7d787',        '',           'bold']
	\ , 'PreProc'                     : [    247,     '',               '',      '9e9e9e',        '',               '']
	\ , 'Type'                        : [     67,     '',           'bold',      '5f87af',        '',           'bold']
	\ , 'String'                      : [    143,     '',               '',      'afaf5f',        '',               '']
	\ , 'Number'                      : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'Define'                      : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'Error'                       : [    208,    124,               '',      'ff8700',  'af0000',               '']
	\ , 'Function'                    : [    179,     '',               '',      'd7af5f',        '',               '']
	\ , 'Include'                     : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'PreCondit'                   : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'Keyword'                     : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'Search'                      : [    231,    131,               '',      '000000',  'ffff5f', 'underline,bold']
	\ , 'Title'                       : [    231,     '',               '',      'ffffff',        '',               '']
	\ , 'Delimiter'                   : [    246,     '',               '',      '949494',        '',               '']
	\ , 'StorageClass'                : [    187,     '',               '',      'd7d7af',        '',               '']
	\ , 'Operator'                    : [    180,     '',               '',      'd7af87',        '',               '']
	\
	\ , 'TODO'                        : [    228,     94,           'bold',      'ffff87',  '875f00',           'bold']
	\
	\ , 'SyntasticWarning'            : [    220,     94,               '',      'ffff87',  '875f00',           'bold']
	\ , 'SyntasticError'              : [    202,     52,               '',      'ffff87',  '875f00',           'bold']
	\
	\ , 'Pmenu'                       : [    248,    240,               '',      'a8a8a8',  '585858',               '']
	\ , 'PmenuSel'                    : [    253,    245,               '',      'dadada',  '8a8a8a',               '']
	\ , 'PmenuSbar'                   : [    253,    248,               '',      'dadada',  'a8a8a8',               '']
	\
	\ , 'phpEOL'                      : [    245,     '',               '',      'dadada',        '',               '']
	\ , 'phpStringDelim'              : [     94,     '',               '',      '875f00',        '',               '']
	\ , 'phpDelimiter'                : [    160,     '',               '',      'd70000',        '',               '']
	\ , 'phpFunctions'                : [    221,     '',           'bold',      'ffd75f',        '',           'bold']
	\ , 'phpBoolean'                  : [    172,     '',           'bold',      'd78700',        '',           'bold']
	\ , 'phpOperator'                 : [    215,     '',               '',      'ffaf5f',        '',               '']
	\ , 'phpMemberSelector'           : [    138,     '',           'bold',      'af8787',        '',           'bold']
	\ , 'phpParent'                   : [    227,     '',               '',      'ffff5f',        '',               '']
	\
	\ , 'PHPClassTag'                 : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'PHPInterfaceTag'             : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'PHPFunctionTag'              : [    222,     '',           'bold',      'ffd787',        '',           'bold']
	\
	\ , 'pythonDocString'             : [    240,    233,               '',      '585858',  '121212',               '']
	\ , 'pythonDocStringTitle'        : [    245,    233,               '',      'dadada',  '121212',               '']
	\ , 'pythonRun'                   : [     65,     '',               '',      '5f875f',        '',               '']
	\ , 'pythonBuiltinObj'            : [     67,     '',           'bold',      '5f87af',        '',           'bold']
	\ , 'pythonSelf'                  : [    250,     '',           'bold',      'bcbcbc',        '',           'bold']
	\ , 'pythonFunction'              : [    179,     '',           'bold',      'd7af5f',        '',           'bold']
	\ , 'pythonClass'                 : [    221,     '',           'bold',      'ffd75f',        '',           'bold']
	\ , 'pythonExClass'               : [    130,     '',               '',      'af5f00',        '',               '']
	\ , 'pythonException'             : [    130,     '',           'bold',      'af5f00',        '',           'bold']
	\ , 'pythonOperator'              : [    186,     '',               '',      'd7d787',        '',               '']
	\ , 'pythonPreCondit'             : [    152,     '',           'bold',      'afd7d7',        '',           'bold']
	\ , 'pythonDottedName'            : [    166,     '',               '',      'd75f00',        '',               '']
	\ , 'pythonDecorator'             : [    124,     '',           'bold',      'af0000',        '',           'bold']
	\
	\ , 'PythonInterfaceTag'          : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'PythonClassTag'              : [    221,     '',               '',      'ffd75f',        '',               '']
	\ , 'PythonFunctionTag'           : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'PythonVariableTag'           : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'PythonMemberTag'             : [    145,     '',               '',      'afafaf',        '',               '']
	\
	\ , 'CTagsImport'                 : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'CTagsClass'                  : [    221,     '',               '',      'ffd75f',        '',               '']
	\ , 'CTagsFunction'               : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'CTagsGlobalVariable'         : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'CTagsMember'                 : [    145,     '',               '',      'afafaf',        '',               '']
	\
	\ , 'xmlTag'                      : [    149,     '',           'bold',      'afd75f',        '',           'bold']
	\ , 'xmlTagName'                  : [    250,     '',               '',      'bcbcbc',        '',               '']
	\ , 'xmlEndTag'                   : [    209,     '',           'bold',      'ff875f',        '',           'bold']
	\
	\ , 'cssImportant'                : [    166,     '',           'bold',      'd75f00',        '',           'bold']
	\
	\ , 'DiffAdd'                     : [    112,     22,               '',      '87d700',  '005f00',               '']
	\ , 'DiffChange'                  : [    220,     94,               '',      'ffd700',  '875f00',               '']
	\ , 'DiffDelete'                  : [    160,     '',               '',      'd70000',        '',               '']
	\ , 'DiffText'                    : [    220,     94,   'reverse,bold',      'ffd700',  '875f00',   'reverse,bold']
	\
	\ , 'diffLine'                    : [     68,     '',           'bold',      '5f87d7',        '',           'bold']
	\ , 'diffFile'                    : [    242,     '',               '',      '6c6c6c',        '',               '']
	\ , 'diffNewFile'                 : [    242,     '',               '',      '6c6c6c',        '',               '']
	\
	\ , 'markdownH1'                  : [    214,     '',           'bold',      'ffaf00',        '',           'bold']
	\ , 'markdownH2'                  : [    202,     '',           'bold',      'ff5f00',        '',           'bold']
	\ , 'markdownH3'                  : [    173,     '',           'bold',      'd7875f',        '',           'bold']
	\ , 'markdownH4'                  : [    179,     '',           'bold',      'd7af5f',        '',           'bold']
	\ , 'markdownH5'                  : [    186,     '',               '',      'd7d787',        '',               '']
	\ , 'markdownH6'                  : [    187,     '',               '',      'd7d7af',        '',               '']
	\ , 'markdownHeadingRule'         : [    160,     '',           'bold',      'd70000',        '',           'bold']
	\ , 'markdownBold'                : [    231,     '',           'bold',      'ffffff',        '',           'bold']
	\ , 'markdownItalic'              : [    222,     '',               '',      'ffd787',        '',               '']
	\ , 'markdownBoldItalic'          : [    222,     '',           'bold',      'ffd787',        '',           'bold']
	\ , 'markdownListMarker'          : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'markdownOrderedListMarker'   : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'markdownCode'                : [    143,    234,               '',      'afaf5f',  '1c1c1c',               '']
	\ , 'markdownCodeBlock'           : [    143,    234,               '',      'afaf5f',  '1c1c1c',               '']
	\ , 'markdownCodeDelimiter'       : [    243,    234,               '',      '767676',  '1c1c1c',               '']
	\ , 'markdownBlockquote'          : [    246,     '',               '',      '949494',        '',               '']
	\ , 'markdownLink'                : [     74,     '',               '',      '5fafd7',        '',               '']
	\ , 'markdownLinkText'            : [     74,     '',           'bold',      '5fafd7',        '',           'bold']
	\ , 'markdownLinkTextDelimiter'   : [    246,     '',               '',      '949494',        '',               '']
	\ , 'markdownUrl'                 : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'markdownUrlDelimiter'        : [    246,     '',               '',      '949494',        '',               '']
	\ , 'markdownId'                  : [    152,     '',               '',      'afd7d7',        '',               '']
	\ , 'markdownIdDeclaration'       : [    109,     '',           'bold',      '87afaf',        '',           'bold']
	\ , 'markdownRule'                : [    240,     '',               '',      '585858',        '',               '']
	\ , 'markdownFootnote'            : [    152,     '',               '',      'afd7d7',        '',               '']
	\ , 'markdownFootnoteDefinition'  : [    152,     '',               '',      'afd7d7',        '',               '']
\ })

hi link htmlTag            xmlTag
hi link htmlTagName        xmlTagName
hi link htmlEndTag         xmlEndTag

hi link phpCommentTitle    vimCommentTitle
hi link phpDocTags         vimCommentString
hi link phpDocParam        vimCommentTitle

hi link diffAdded          DiffAdd
hi link diffChanged        DiffChange
hi link diffRemoved        DiffDelete

" Tree-sitter markdown support
hi link @markup.heading.1           markdownH1
hi link @markup.heading.2           markdownH2
hi link @markup.heading.3           markdownH3
hi link @markup.heading.4           markdownH4
hi link @markup.heading.5           markdownH5
hi link @markup.heading.6           markdownH6
hi link @markup.heading             markdownH1
hi link @markup.strong              markdownBold
hi link @markup.italic              markdownItalic
hi link @markup.strikethrough       Comment
hi link @markup.list                markdownListMarker
hi link @markup.list.unchecked      markdownListMarker
hi link @markup.list.checked        markdownBold
hi link @markup.link                markdownLink
hi link @markup.link.label          markdownLinkText
hi link @markup.link.url            markdownUrl
hi link @markup.raw                 markdownCode
hi link @markup.raw.block           markdownCodeBlock
hi link @markup.quote               markdownBlockquote
hi link @string.special.url         markdownUrl
hi link @punctuation.special        markdownListMarker
hi link @punctuation.delimiter      Delimiter
