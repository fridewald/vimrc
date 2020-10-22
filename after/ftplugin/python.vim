" PEP 8 recommendation
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent

" set path to python
" setlocal path=src/**,tests/bin/**
setlocal wildignore=*/__pycache__/*,*.pyc

set include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\($\\\|\ as\\)

" import conv.metrics
" from conf import conversion

function! PyInclude(fname)
    let parts = split(a:fname, ' import ')
    let l = parts[0]
    if len(parts) > 1
        let r = parts[1]
        let joined = join([l, r], '.')
        let fp = substitute(joined, '\.', '/', 'g').'.py'
        let found = glob(fp, 1)
        if len(found)
            return found
        endif
    endif
    return substitute(l, '\.', '/', 'g').'.py'
endfunction

setlocal includeexpr=PyInclude(v:fname)

set define=^\\s*\\<\\(def\\\|class\\)\\>
