-- load standard vis module, providing parts of the Lua API
	require('vis')
	require('plugins/filetype')
	require('plugins/textobject-lexer');

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options e.g.
	-- vis:command('map! normal j gj')
	vis:command('map! visual <M-p> ":> {plumber <&3 3<&- & } 3<&0 1>&- 2>&- <Enter><vis-mode-normal>"')
	vis:command('map! normal <M-p> "Evb:> { plumber <&3 3<&- & } 3<&0 1>&- 2>&- <Enter><vis-mode-normal>"')
	vis:command('map! normal <M-t> "evb:>ctagmenu<Enter><vis-mode-normal>"')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- enable syntax highlighting for known file types

	-- Your per window configuration options e.g.
	-- vis:command('set number')
	vis:command("set theme".. (vis.ui.colors <= 16 and "default-16" or "defalt-256"))
	vis:command('set autoindent')
	vis:command('set tabwidth 4')
end)

vis.events.subscribe(vis.events.FILE_PRESAVE, function()
	vis:command(':%s/\t$//g')
	vis:command(':%s/ $//g')
end)

vis.events.subscribe(vis.events.FILE_SAVE, function(file)
	-- lint, putting output in split
	-- have filetype inferrence, reuse the vis bits where I can
	-- lint.output(win)
end)
