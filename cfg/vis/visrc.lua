-- load standard vis module, providing parts of the Lua API
	require('vis')

vis.events.start = function()
	-- Your global configuration options e.g.
	-- vis:command('map! normal j gj')
	vis:command('map! visual <M-p> ":> {plumber <&3 3<&- & } 3<&0 1>&- 2>&- <Enter><vis-mode-normal>"')
	vis:command('map! normal <M-p> "EvB:> { plumber <&3 3<&- & } 3<&0 1>&- 2>&- <Enter><vis-mode-normal>"')
	vis:command('map! normal <M-t> "evB:>ctagmenu<Enter><vis-mode-normal>"')
end

vis.events.win_open = function(win)
	-- enable syntax highlighting for known file types
	vis.filetype_detect(win)

	-- Your per window configuration options e.g.
	-- vis:command('set number')
	vis:command('set theme solarized')
	vis:command('set autoindent')
	vis:command('set tabwidth 4')
end

vis.events.file_presave = function()
	vis:command(':%s/\t$//g')
	vis:command(':%s/ $//g')
end
