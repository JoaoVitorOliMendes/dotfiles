call plug#begin('~/.vim/plugged')

	Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'ryanoasis/vim-devicons'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'itchyny/lightline.vim'
	Plug 'jiangmiao/auto-pairs'

call plug#end()

autocmd VimEnter * NERDTree

let g:NERDTreeGitStatusIndicatorMapCustom = {
			\ 'Modified'  :'✹', 
			\ 'Staged'    :'✚',
			\ 'Untracked' :'✭',
			\ 'Renamed'   :'➜',                 
			\ 'Unmerged'  :'═',                 
			\ 'Deleted'   :'✖',                 
			\ 'Dirty'     :'✗',                 
			\ 'Ignored'   :'☒',                 
			\ 'Clean'     :'✔︎',                 
			\ 'Unknown'   :'?',                 
			\ }
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:NERDTreeIgnore = ['^node_modules$']

function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

let g:tmux_navigator_no_mappings = 1

inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <c-Left>  :TmuxNavigateLeft<cr>
nnoremap <silent> <c-Down>  :TmuxNavigateDown<cr>
nnoremap <silent> <c-Up>    :TmuxNavigateUp<cr>
nnoremap <silent> <c-Right> :TmuxNavigateRight<cr>

set number relativenumber
