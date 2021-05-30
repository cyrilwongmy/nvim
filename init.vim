filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set nocompatible
set mouse=a
set encoding=utf-8
syntax on
set number
set wrap
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set tabstop=2
set shiftwidth=2
set softtabstop=2
set incsearch
set ignorecase
set smartcase
set list
set scrolloff=5
set backspace=indent,eol,start
set ttimeoutlen=0
set notimeout
" set foldmethod=indent " if needs folding all codes when enter file, uncommet
set laststatus=2
set autochdir
set ttyfast
set lazyredraw
" set clipboard=unnamedplus
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

map Q :q<CR>
map S :w<CR>
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map tu :tabe<CR>
map tj :-tabnext<CR>
map tk :+tabnext<CR>

noremap = nzz
noremap - Nzz

noremap J 5j
noremap K 5k

let mapleader=" "
noremap <LEADER><CR> :nohlsearch<CR>

" Indentation
nnoremap < <<
nnoremap > >>

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y
nnoremap P "+p

" ===
" === Markdown Settings
" ===
" Snippets
source $HOME/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


noremap R :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %<"
		exec "!./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:!./%<
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	endif
endfunc


call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'


Plug 'morhetz/gruvbox'
Plug 'theniceboy/nvim-deus'

Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'

" Editor Enhancement
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomtom/tcomment_vim' " in gcc to comment a line
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'mg979/vim-visual-multi'
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-after-object' " da= to delete what's after =
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
Plug 'easymotion/vim-easymotion'
Plug 'hrsh7th/vim-eft'


" Other visual enhancement
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-xtabline'
Plug 'ryanoasis/vim-devicons'
Plug 'wincent/terminus'


Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite


" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'
Plug 'vimwiki/vimwiki'


Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" Status line
Plug 'ojroques/vim-scrollstatus'

" General Highliter
Plug 'RRethy/vim-illuminate'

" File Navigation
Plug 'kevinhwang91/rnvimr'
Plug 'airblade/vim-rooter'
Plug 'pechorin/any-jump.vim'
Plug 'psliwka/vim-smoothie'
Plug 'rhysd/accelerated-jk'



" Taglist
Plug 'liuchengxu/vista.vim'

" Undo Tree
Plug 'mbbill/undotree'

" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'kdheepak/lazygit.nvim'

Plug 'mhinz/vim-startify'
call plug#end()

colorscheme gruvbox

" ===
" === neovim built-in LSP
" ===


" ===
" === coc.nvim
" ===
" let g:coc_global_extensions = [
" 			\ 'coc-actions',
" 			\ 'coc-yank',
" 			\ 'coc-diagnostic',
" 			\ 'coc-explorer',
" 			\ 'coc-gitignore',
" 			\ 'coc-tabnine',
" 			\ 'coc-sql',
" 			\ 'coc-translator',
" 			\ 'coc-python',
" 			\ 'coc-task',
" 			\ 'coc-json',
" 			\ 'coc-java',
" 			\ 'coc-snippets',
" 			\ 'coc-syntax',
" 			\ 'coc-vimlsp']
" set hidden
" set updatetime=0
" set shortmess+=c
"
"
" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
" 			\ pumvisible() ? "\<C-n>" :
" 			\ <SID>check_back_space() ? "\<TAB>" :
" 			\ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
" 	let col = col('.') - 1
" 	return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
" 			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
"
"
" " Use <c-g> to trigger completion.
" " Following for neovim, vim check in CoC github
" inoremap <silent><expr> <c-g> coc#refresh()
" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
"
" " Use leader+h to show documentation in preview window.
" nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>
" function! s:show_documentation()
" 	if (index(['vim','help'], &filetype) >= 0)
" 		execute 'h '.expand('<cword>')
" 	elseif (coc#rpc#ready())
" 		call CocActionAsync('doHover')
" 	else
" 		execute '!' . &keywordprg . " " . expand('<cword>')
" 	endif
" endfunction
"
" nmap <leader>rn <Plug>(coc-rename)
"
" " Remap for do codeAction of selected region
" function! s:cocActionsOpenFromSelected(type) abort
" 	execute 'CocCommand actions.open ' . a:type
" endfunction
" xmap <silent> <leader>a  :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
" nmap <silent> <leader>a  :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" " xmap <silent> <leader>a  <Plug>(coc-codeaction-selected)
" " nmap <silent> <leader>aw  <Plug>(coc-codeaction-selected)w
"
"
" " Map function and class text objects
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)
"
" " Useful commands
" nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
" set clipboard=unnamedplus
" nmap tt :CocCommand explorer<CR>
" " coc-translator
" nmap ts <Plug>(coc-translator-p)
" " coc-snippets
" imap <C-l> <Plug>(coc-snippets-expand)
" imap <C-j> <Plug>(coc-snippets-expand-jump)
" let g:snips_author = "Cyril Wang"
"
" " coc-tasks
" noremap <silent> <leader>ts :CocList tasks<CR>
" TODO: change <CR> for completion
" autoformat: download correct one, and try it.
" Prettier
" Beautiful Tab
" Java config
" coc-explorer
" easy-motion
" fuzzy search
" vim-surround
" vim-easy-motion


let g:python3_host_prog="/usr/local/bin/python3"

" Vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
			\ 'syntax': 'markdown', 'ext': '.md'}]

" vim airline scroll
let g:airline_section_x = '%{ScrollStatus()}'

" ===
" === vim-illuminate
" ===
" let g:Illuminate_delay = 250
hi illuminatedWord cterm=undercurl gui=undercurl

" ===
" === rnvimr
" ===
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> <LEADER>R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
			\ '<C-t>': 'NvimEdit tabedit',
			\ '<C-x>': 'NvimEdit split',
			\ '<C-v>': 'NvimEdit vsplit',
			\ 'gw': 'JumpNvimCwd',
			\ 'yw': 'EmitRangerCwd'
			\ }
let g:rnvimr_layout = { 'relative': 'editor',
			\ 'width': &columns,
			\ 'height': &lines,
			\ 'col': 0,
			\ 'row': 0,
			\ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]


" ===
" === vim-rooter
" ===
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1

" ===
" === any-jump
" ===
nnoremap <LEADER>y :AnyJump<CR>
let g:any_jump_window_width_ratio  = 0.8
let g:any_jump_window_height_ratio = 0.9
let g:any_jump_disable_default_keybindings = 1 " avoid comflit with leader+jump
" ===
" === Vista.vim
" ===
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["??? ", "??? "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
			\   "function": "\uf794",
			\   "variable": "\uf71b",
			\  }

" ===
" === Undotree
" ===
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> j <plug>UndotreeNextState
	nmap <buffer> k <plug>UndotreePreviousState
	nmap <buffer> J 5<plug>UndotreeNextState
	nmap <buffer> K 5<plug>UndotreePreviousState
endfunc

" ==
" == GitGutter
" ==
" let g:gitgutter_signs = 0
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'

let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
" autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>

" ===
" === lazygit.nvim
" ===
noremap <LEADER>la :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support


" ===
" === Agit
" ===
nnoremap <LEADER>gl :Agit<CR>
let g:agit_no_default_mappings = 1

" ===
" === vim-instant-markdown
" ===
" let g:instant_markdown_slow = 0
" let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1


" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

" ===
" === Leaderf
" ===
" let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
        \ 'dir': ['.git', 'vendor', 'node_modules'],
        \ 'file': ['__vim_project_root', 'class']
        \}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0

" ===
" === Bullets.vim
" ===
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]

nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)


" eft
" nmap ; <Plug>(eft-repeat)
" xmap ; <Plug>(eft-repeat)

nmap f <Plug>(eft-f)
xmap f <Plug>(eft-f)
omap f <Plug>(eft-f)
nmap F <Plug>(eft-F)
xmap F <Plug>(eft-F)
omap F <Plug>(eft-F)

" nmap t <Plug>(eft-t)
" xmap t <Plug>(eft-t)
" omap t <Plug>(eft-t)
" nmap T <Plug>(eft-T)
" xmap T <Plug>(eft-T)
" omap T <Plug>(eft-T)
