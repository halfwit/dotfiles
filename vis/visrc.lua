-- load standard vis module, providing parts of the Lua API
require('vis')

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
	vis:command("set theme monotone")
	vis:command("set tab 4")
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	-- vis:command('set number')
end)

vis.events.subscribe(vis.events.FILE_SAVE_POST, function(file, path)
	os.execute('lint `pfw` &')
	os.execute('$XDG_DATA_HOME/x11/gitbar commit 2&1>/dev/null &')
end)
