function! s:highlight()
	let list = taglist('.*')

	for item in list
		let kind = item.kind

		if kind == 'f' || kind == 'c'
			let name = item.name
			exec 'syntax keyword Identifier '.name
		endif
	endfor
endfunction

call s:highlight()
