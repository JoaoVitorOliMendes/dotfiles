call plug#begin('~/.vim/plugged')

        Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'itchyny/lightline.vim'
	Plug 'alvan/vim-closetag'
	Plug 'yuezk/vim-js'
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'tpope/vim-surround'
	Plug 'famiu/nvim-reload'
        Plug 'jiangmiao/auto-pairs'
        Plug 'matze/vim-move'
        Plug 'jdhao/whitespace.nvim'

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

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.jsx,*.js,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,js,tsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js,tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" COC-Config
"
let g:move_key_modifier = 'C'

command! -nargs=0 Prettier :CocCommand prettier.formatFile
"let g:coc_global_extensions = [
"	\ 'coc-snippets',
"	\ 'coc-pairs',
"	\ 'coc-tsserver',
"	\ 'coc-html',
"	\ 'coc-css',
"	\ 'coc-prettier',
"	\ 'coc-json',
"	\ 'coc-angular',
"	\ 'coc-vimtex'
"]

inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <c-Left>  :TmuxNavigateLeft<cr>
nnoremap <silent> <c-Down>  :TmuxNavigateDown<cr>
nnoremap <silent> <c-Up>    :TmuxNavigateUp<cr>
nnoremap <silent> <c-Right> :TmuxNavigateRight<cr>

set number relativenumber
set shiftwidth=2
set expandtab
set softtabstop=2

autocmd BufWritePost * :StripTrailingWhitespace
