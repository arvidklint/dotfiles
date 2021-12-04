if exists('g:loaded_switcher') | finish | endif " prevent loading file twice

function! ReloadSwitcher()
lua << EOF
    for k in pairs(package.loaded) do
        if k:match("^switcher") then
            package.loaded[k] = nil
        end
    end
EOF
endfunction

" Reload the plugin
nnoremap <Leader>pr :call ReloadSwitcher()<CR>

" Test the plugin
nnoremap <Leader>pt :lua require("switcher").switch()<CR>
nnoremap <Leader>pc :lua require("switcher").clear()<CR>

function SwitcherSaveFromLines()
  lua require('switcher').save_start_lines()
endfunction

function SwitcherSwitch()
  lua require('switcher').switch()
endfunction

augroup _Switcher
  au!
  " autocmd BufLeave * call SwitcherSaveFromLines()
  autocmd BufEnter * call SwitcherSwitch()
augroup END

let g:loaded_switcher = 1
