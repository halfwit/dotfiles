local RUNTIME_DIR = os.getenv("XDG_RUNTIME_DIR")
RUNTIME_DIR = RUNTIME_DIR or os.getenv("HOME").."/.local/run"

function update_bar(name)
	title = mp.get_property("media-title")
	local f = io.open(RUNTIME_DIR.."/statusbar/media", "w")
	f:write(title.." ")
	f:flush()
	f:close()
	os.execute('/usr/local/share/hwwm/wshuf | xe -s \'wtp $1 $2 $3 $4 $5\' &')
end

function clean_bar(reason)
	local f = io.open(RUNTIME_DIR.."/statusbar/media", "w")
	f:write("")
	f:flush()
	f:close()
end

mp.observe_property("media-title", "string", update_bar)
mp.register_event("end-file", clean_bar)