" turn on the syntax checker
syntax on
let g:ale_lint_on_text_changed = 'always'

 let g:ale_fixers = {
 \ '*': ['remove_trailing_lines', 'trim_whitespace'],
 \   'javascript': ['eslint', 'prettier'],
 \   'css': ['eslint', 'prettier'],
 \   'vue': ['eslint', 'prettier'],
 \   'html': ['eslint', 'prettier'],
 \}

 let g:ale_javascript_prettier_options = '--single-quote --semi --trailing-comma all'

" don't check syntax immediately on open or on quit
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1


" show number of errors
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}

" format error strings
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
