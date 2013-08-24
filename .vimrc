"display line numbers
set number

"tabs, spaces
set noet sts=0 sw=4 ts=4

"automatic code indentation
set cindent
set cinoptions=(0,u0,U0

"toggle insert mode with CTRL-SPACE
nnoremap <C-space> a
imap <C-space> <Esc>


"vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'bling/vim-airline'

"pathogen init
execute pathogen#infect()

"omnicomplete
set nocp
filetype plugin on

map <F4> :w! <CR> :silent !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --sort=foldcase %:p:h <CR> :edit! <CR>
if v:version >= 600
	filetype plugin on
	filetype indent on
	else
	filetype on
endif

if v:version >= 700
	set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
	let OmniCpp_GlobalScopeSearch   = 1
	let OmniCpp_DisplayMode         = 1
	let OmniCpp_ShowScopeInAbbr     = 1 "do not show namespace in pop-up
	let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
	let OmniCpp_ShowAccess          = 1 "show access in pop-up
	let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
	set completeopt=menuone,menu,longest
endif

if version >= 700
  let g:SuperTabDefaultCompletionType = "context"
  let g:SuperTabContextDefaultCompletionType = "<C-X><C-O>"
  let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
  highlight   clear
  highlight   Pmenu         ctermfg=0 ctermbg=2
  highlight   PmenuSel      ctermfg=0 ctermbg=7
  highlight   PmenuSbar     ctermfg=7 ctermbg=0
  highlight   PmenuThumb    ctermfg=0 ctermbg=7
endif

"termal settings
if $COLORTERM == 'gnome-terminal'

	"gnome-term 256-colors support hack
	set t_Co=256

	"set mustang as dafult terminal colorscheme
	set background=dark
	colors mustang
endif

"NerdTree
map <C-n><C-n> :NERDTreeToggle<CR>

"Taglist
map <C-n><C-t> :TlistToggle<CR>

"fuzzy search
set runtimepath^=~/.vim/bundle/ctrlp.vim

"GUI options
if has('gui_running')

	"set dark solarized colorscheme for GUI as dafault
	set background=dark
	colors solarized 

	"CTRL-N-L 	use light solarized colorscheme (GUI default)
	map <C-n><C-l> :set background=light<CR>:colorscheme solarized<CR>

	"CTRL-N-D 	use dark solarized colorscheme
	map <C-n><C-d> :set background=dark<CR>:colorscheme solarized<CR>

	"CTRL-N-M 	use mustang colorscheme (terminal dafault)
	map <C-n><C-m> :colorscheme mustang<CR>

	"CTRL-N-H 	hide menu & toolbar
	map <C-n><C-h> :set guioptions-=m<CR>:set guioptions-=T<CR>

	"CTRL-N-S 	show menu & toolbar
	map <C-n><C-s> :set guioptions+=m<CR>:set guioptions+=T<CR>

	"set GUI deafults [hide toolbar, menu, scrollbars]
	set guioptions=

	"indent guides
	let g:indent_guides_guide_size = 1
	let g:indent_guides_space_guides = 0 " don't consider spaces as indentation
	let g:indent_guides_color_change_percent = 5 " 5% color delta from colorscheme
	let g:indent_guides_enable_on_vim_startup = 0 " don't start plugin with vim
	map <C-n><C-i> :IndentGuidesToggle<CR>

	"powerline compatibile font as default
	set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
endif

"airline
set laststatus=2
let g:airline_powerline_fonts = 1
set noshowmode
