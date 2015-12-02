"
"How to install Neobundle vim"
"
" $ mkdir -p ~/.vim/bundle
"   git clone git://github.com/Shougo/neobundle.vim  ~/.vim/bundle/neobundle.vim
"
"swapファイルを作らない
set noswapfile

"バックアップファイルを作らない
set nobackup

"undoファイル機能を無効化
set noundofile

"新しい行のインデントを現在行と同じにする
set autoindent

"改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

"vi互換機能をOFFに
set nocompatible

"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden

"行番号を表示する
set number

"タブの代わりに空白文字を指定する
set expandtab

"画面上でタブ文字が占める幅
set tabstop=2

"自動インデントでずれる幅
set shiftwidth=2

"連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2

"不可視文字を表示
"set list
"set listchars=tab:>-,trail:.

"vimのクリップボードをOSと共通に
set clipboard=unnamed,autoselect

"右下に行、列の番号を表示する
set noruler

"対応かっこをハイライト表示する
set showmatch

"エンコード
set encoding=utf8

"追加
scriptencoding utf-8

"ファイルエンコード
set fileencoding=utf-8

"バックスペース拡張
set backspace=indent,eol,start

"シンタックスハイライトを有効
syntax enable

"背景をダークに
set background=dark

"コマンドラインに使われる画面上の行数
set cmdheight=2

"エディタウィンドウの末尾から二行目にステータスラインを常時表示
set laststatus=2

"小文字のみで検索した時に大文字小文字を無視
set smartcase

"入力中のコマンドを表示
"set showcmd

"vimrc編集コマンド F5は編集画面を開く F6はvimrcを反映
nnoremap <F5> :<C-u>edit $MYVIMRC<CR>
nnoremap <F6> :<C-u>source $MYVIMRC<CR>

let OSTYPE = system('uname')

filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'godlygeek/tabular'
NeoBundle 'joker1007/vim-markdown-quote-syntax'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'cohama/vim-smartinput-endwise'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \   },
  \ }
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neoinclude.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'justmao945/vim-clang'
NeoBundle 'tpope/vim-obsession'
if has('lua')
  NeoBundle 'Shougo/neocomplete'
endif

call neobundle#end()

filetype plugin indent on




""" vim-smartinput and vim-endwise
call smartinput_endwise#define_default_rules()
call smartinput#map_to_trigger('i', '<Plug>(smartinput_BS)',
      \                        '<BS>',
      \                        '<BS>')
call smartinput#map_to_trigger('i', '<Plug>(smartinput_C-h)',
      \                        '<BS>',
      \                        '<C-h>')
call smartinput#map_to_trigger('i', '<Plug>(smartinput_CR)',
      \                        '<Enter>',
      \                        '<Enter>')

""" markdown config
let g:markdown_quote_syntax_codeblocks = [["^\\s*\\~\\{3,}\.*\\.\\?", ".*$","^\\s*\\~\\{3,}\\ze\\s*$"]]

let g:vim_markdown_liquid=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_math=1
let g:vim_markdown_folding_disabled=1
au BufRead,BufNewFile *.{txt,text} set filetype=markdown

set t_Co=256

""" QuickRun Config
let g:quickrun_config = {}

if OSTYPE == "Darwin\n"
  let g:quickrun_config.markdown = {
        \ 'outputter' : 'null',
        \ 'command'   : 'open',
        \ 'cmdopt'    : '-a',
        \ 'args'      : 'Marked\ 2',
        \ 'exec'      : '%c %o %a %s',
        \ }
endif

nnoremap <silent> <C-@> :QuickRun<CR>

""" Unite.vim
"入力モードで開始する
let g:unite_enable_start_insert=1

"yank履歴を保存する
let g:unite_source_history_yank_enable=1

"ファイルの使用履歴を1000まで保存する
let g:unite_source_file_mru_limit=1000

"バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>

"ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

"最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite buffer file_mru<CR>

"yank履歴
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>

" ウィンドウを横に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"カラースキーマをSolarizedにする
colorscheme solarized

"""コマンドラインの設定
"コマンドラインの履歴を1000件保存する
set history=1000

set showtabline=2
set noshowmode

set guifont=RictyForPowerline-Regular:h14

if OSTYPE == "Darwin\n"
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"\u2b064":""}',
      \ },
      \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
      \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
      \}
endif

" vim-clang用のオプション
let g:clang_auto = 0
let g:clang_c_completeopt = 'menuone'
let g:clang_cpp_completeopt = 'menuone'
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
let g:clang_check_syntax_auto = 1
let g:clnag_pwheight = 4

if OSTYPE =="Darwin\n"
let g:neoinclude#paths = {
      \ 'cpp': '/usr/local/Cellar/boost/1.59.0/include,/Applications/Xcode.app/Contents/Developer/ToolChains/XcodeDefault.xctoolchain/usr/include/c++/v1,/usr/include',
      \}
endif

" これ以降はneocompleteの設定です。主にgithubからのパクリ
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Original Setting
" Set max completion list
let g:neocomplete#max_list = 20
" set max keyword length
let g:neocomplete#max_keyword_width = 20
" set smart completion length
let g:neocomplete#auto_completion_start_length = 3

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif

let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"let g:neocomplete#sources#include#patterns.cpp = '/usr/local/Cellar/boost/1.59.0/include'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup() . "\<Plug>(smartinput_BS)"
imap <expr><BS> neocomplete#smart_close_popup() . "\<Plug>(smartinput_BS)"

" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" うざい上のdocポップアップを除去
autocmd FileType python setlocal completeopt-=preview

" jedi-vimの為の設定
autocmd FileType python setlocal omnifunc=jedi#completions

let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
      let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

" clnag-vimの為のneocomplete設定         
let g:neocomplete#force_omni_input_patterns.c =
              \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
              \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
"call neocomplete#custom#source('include',
"\ 'disabled_filetypes', {'cpp' : 1})


