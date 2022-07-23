# TODO: create a function for repeat window resize

```vim
nnoremap <C-W>- :call RepeatResize('-')<CR>
nnoremap <C-W>+ :call RepeatResize('+')<CR>
nnoremap <C-W>< :call RepeatResize('<')<CR>
nnoremap <C-W>> :call RepeatResize('>')<CR>

function! RepeatResize(first)
    let l:command = a:first
    while stridx('+-><', l:command) != -1
        execute "normal! \<C-w>" . l:command
        redraw
        let l:command = nr2char(getchar())
    endwhile
endfunction
```
