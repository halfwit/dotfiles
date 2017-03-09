local lexers = vis.lexers

local colors = {
	['base03']  = '0', -- '#fbf1c7',
	['base02']  = '235', -- '#ebdbb2',
	['base0']   = '244', -- '#928374',
	['base2']   = '187', -- '#3c3836',
	['base3']   = '15', -- '#282828',
	['blue']    = '4',  -- '#076678',
} 

lexers.colors = colors
local fg = ',fore:'..colors.base3..','
local bg = ',back:'..colors.base03..','
lexers.STYLE_DEFAULT = bg..fg
lexers.STYLE_NOTHING = bg
lexers.STYLE_COMMENT = 'fore:'..colors.blue
lexers.STYLE_LINENUMBER = fg
lexers.STYLE_CURSOR = 'fore:'..colors.base03..',back:'..colors.base0
lexers.STYLE_CURSOR_PRIMARY = lexers.STYLE_CURSOR..',back:yellow'
lexers.STYLE_CURSOR_LINE = 'back:'..colors.base02
lexers.STYLE_COLOR_COLUMN = 'back:'..colors.base02
lexers.STYLE_SELECTION = 'back:white'
