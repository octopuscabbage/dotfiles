if !has('python')
	finish
endif

function! MakeSetup()
	exe 'py3file ' . s:plugin_path . '/makesetup.py'
endfunc

command! MakeSetup call MakeSetup()
