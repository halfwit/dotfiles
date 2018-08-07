-- load standard vis module, providing parts of the Lua API
require('vis')

vis.events.subscribe(vis.events.INIT, function()
	vis:command("set theme monotone")
	vis:command("set tab 4")
end)

-- vis events file open set up our mapping with a closure 
vis.events.subscribe(vis.events.FILE_OPEN, function(file)
	vis:map(vis.modes.NORMAL, "<C-l>", function()
		os.execute('/usr/local/bin/lint '..file.path..' &')
	end, "lint currently open file")
	vis:map(vis.modes.NORMAL, "<C-t>", function()
		os.execute('/usr/local/bin/tasks '..file.path..' &')
	end, "run tasks binary on current file")
	--vis:map(vis.modes.NORMAL, "<C-p>", function()
	--	TODO: os.execute('/usr/local/bin/plumber '..vis. &')
	--end, "plumb the current line")
end)

vis.events.subscribe(vis.events.FILE_SAVE_POST, function(file, path)
	-- Update our bar on write
	os.execute('/usr/local/share/hwwm/gitbar commit >/dev/null 2&>1 &')
end)
