" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" ==================== Editor behavior ====================
" System
set nocompatible
set mouse=
set clipboard=unnamedplus
set encoding=utf-8

" Prevent incorrect backgroung rendering
let &t_ut=''

set exrc
set secure

" Main code display
set number
set relativenumber
set cursorline

" Better tab
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=5

set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix

" Prevent auto line split
set wrap
set tw=0

set indentexpr=
" Better backspace
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set foldenable

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Status/command br
set autochdir
set laststatus=2
set formatoptions-=tc
set showcmd

" Window behaviors
set splitright
set splitbelow

" Searching options
set ignorecase
set smartcase
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview

" Should make scrolling faster
set ttyfast
set lazyredraw
set visualbell

set colorcolumn=100
set virtualedit=block

" Show command autocomplete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu " show a navigable menu for tab completion
set wildmode=longest,list,full

" Restore Cursor Position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ==================== Basic Mappings ====================
" Set <LEADER> as <SPACE>
let mapleader=" "

" Column (:) mods
noremap ; :
nnoremap Q :q<CR>
nnoremap S :w<CR>

" Open the vimrc file anytime
nnoremap <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>
nnoremap <LEADER>rv :e .nvimrc<CR>
augroup NVIMRC
    autocmd!
    autocmd BufWritePost *.nvimrc exec ":so %"
augroup END

" Undo operations
noremap l u

" Insert Key
noremap k i
noremap K I

" Copy to system clipboard
vnoremap Y "+y

" Search
map <LEADER><CR> :nohlsearch<CR>

" ==================== Cursor Movement ====================
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < n   i >
"     e
"     v
noremap <silent> u k
noremap <silent> n h
noremap <silent> e j
noremap <silent> i l
noremap <silent> gu gk
noremap <silent> ge gj
noremap <silent> \v v$h

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> U 5k
noremap <silent> E 5j

" N key: go to the start of the line
noremap <silent> N 0

" I key: go to the end of the line
noremap <silent> I $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>

" ==================== Window management ====================
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>u <C-w>k
noremap <LEADER>e <C-w>j
noremap <LEADER>n <C-w>h
noremap <LEADER>i <C-w>l

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap se :set splitbelow<CR>:split<CR>
noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap si :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K

" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" ==================== Tab management ====================
" Create a new tab with tu
noremap tu :tabe<CR>
noremap tU :tab split<CR>

" Move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>

" Move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>

" ==================== Markdown Settings ====================
" Snippets
"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,l --------<Enter>

" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell

" ==================== Other useful stuff ====================
" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>"_c4l

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		set splitbelow
		:sp
		:res -5
		term gcc % -o %< && time ./%<
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -5
		:term ./%<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'vimwiki'
		exec "MarkdownPreview"
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	endif
endfunc

" ==================== Install Plugins with Vim-Plug ====================
call plug#begin('$HOME/.config/nvim/plugged')
" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'bling/vim-bufferline'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Python
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-python/python-syntax', { 'for' :['python', 'vim-plug'] }

" For general writing
Plug 'junegunn/goyo.vim'

" Undo Tree
Plug 'mbbill/undotree'

" Snippits
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Editor Enhancement
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" LeetCode
" Plug 'ianding1/leetcode.vim'
call plug#end()

" ==================== Dress up my vim ====================
set termguicolors " enable true colors support
colorscheme snazzy
let ayucolor="light"  " for light version of theme
let g:SnazzyTransparent = 1
set background=dark
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

" ==================== NERDTree ==========================
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"


" ==================== NERDTree-git ==========================
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" ==================== MarkdownPreview  ==========================
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" ==================== vim-table-mode  ==========================
map <LEADER>tm :TableModeToggle<CR>

" ==================== Python-syntax  ==========================
let g:python_highlight_all = 1


" ==================== goyo  ==========================
map <LEADER>gy :Goyo<CR>

" ==================== Undotree ====================
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24

" ==================== vimwiki  ====================
let g:vimwiki_list = [{
  \ 'automatic_nested_syntaxes':1,
  \ 'path_html': '~/wiki_html',
  \ 'path': '~/wiki',
  \ 'template_path': '~/.vim/vimwiki/template/',
  \ 'syntax': 'markdown',
  \ 'ext':'.md',
  \ 'template_default':'markdown',
  \ 'custom_wiki2html': '~/.vim/vimwiki/wiki2html.sh',
  \ 'template_ext':'.html'
\}]

" ==================== Ultisnips ====================
let g:tex_flavor = "latex"
inoremap <c-n> <nop>
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']
silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
" Solve extreme insert-mode lag on macOS (by disabling autotrigger)
augroup ultisnips_no_auto_expansion
    au!
    au VimEnter * au! UltiSnips_AutoTrigger
augroup END

" ==================== wildfire ====================
map <c-b> <Plug>(wildfire-quick-select)
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "it"],
    \ "html,xml" : ["at", "it"],
\ }

" ==================== coc.nvim ====================
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-pyright', 'coc-java']

" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()

nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w

" coc-snippets
" imap <C-l> <Plug>(coc-snippets-expand)
" vmap <C-e> <Plug>(coc-snippets-select)
" let g:coc_snippet_next = '<c-e>'
" let g:coc_snippet_prev = '<c-n>'
" imap <C-e> <Plug>(coc-snippets-expand-jump)


" ==================== LeetCode ====================
" nnoremap <leader>ll :LeetCodeList<cr>
" nnoremap <leader>lt :LeetCodeTest<cr>
" nnoremap <leader>ls :LeetCodeSubmit<cr>
" nnoremap <leader>li :LeetCodeSignIn<cr>
" 
" let g:leetcode_browser = "chrome"
