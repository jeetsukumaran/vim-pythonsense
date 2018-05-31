" Key Mappings to Override Default Ones

if ! get(g:, "is_pythonsense_suppress_keymaps", 0) && ! get(g:, "is_pythonsense_suppress_motion_keymaps", 0)

    if !hasmapto('<Plug>PythonsenseStartOfPythonClass')
        map <buffer> [[ <Plug>(PythonsenseStartOfPythonClass)
    endif
    if !hasmapto('<Plug>PythonsenseEndOfPythonClass')
        map <buffer> ][ <Plug>(PythonsenseEndOfPythonClass)
    endif
    if !hasmapto('<Plug>PythonsenseStartOfNextPythonClass')
        map <buffer> ]] <Plug>(PythonsenseStartOfNextPythonClass)
    endif
    if !hasmapto('<Plug>PythonsenseEndOfPreviousPythonClass')
        map <buffer> [] <Plug>(PythonsenseEndOfPreviousPythonClass)
    endif

    if !hasmapto('<Plug>PythonsenseStartOfPythonFunction')
        map <buffer> [m <Plug>(PythonsenseStartOfPythonFunction)
    endif
    if !hasmapto('<Plug>PythonsenseEndOfPythonFunction')
        map <buffer> ]M <Plug>(PythonsenseEndOfPythonFunction)
    endif
    if !hasmapto('<Plug>PythonsenseStartOfNextPythonFunction')
        map <buffer> ]m <Plug>(PythonsenseStartOfNextPythonFunction)
    endif
    if !hasmapto('<Plug>PythonsenseEndOfPreviousPythonFunction')
        map <buffer> [M <Plug>(PythonsenseEndOfPreviousPythonFunction)
    endif

endif
