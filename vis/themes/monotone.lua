local lexers = vis.lexers

local colors = {
	['base03']  = '0', -- '#fbf1c7',
	['base02']  = '235', -- '#ebdbb2',
	['base01']  = '239', -- '#d5c4a1',
	['base00']  = '240', -- '#bdae93',
	['base0']   = '244', -- '#928374',
	['base1']   = '245', -- '#504945',
	['base2']   = '187', -- '#3c3836',
	['base3']   = '15', -- '#282828',
	['yellow']  = '136', -- '#b58900',
	['orange']  = '166', -- '#d65d0e',
	['red']     = '2', -- '#9d0006',
	['magenta'] = '125', -- '#b16286',
	['violet']  = '61',  -- '#8f3f71',
	['blue']    = '4',  -- '#076678',
	['cyan']    = '37',  -- '#427b58',
	['green']   = '64',  -- '#79740e',
} 

lexers.colors = colors
-- dark
local fg = ',fore:'..colors.base3..','
local bg = ',back:'..colors.base03..','
-- light
-- local fg = ',fore:'..colors.base03..','
-- local bg = ',back:'..colors.base3..','

lexers.STYLE_DEFAULT = bg..fg
lexers.STYLE_NOTHING = bg
lexers.STYLE_CLASS = bg..fg
lexers.STYLE_COMMENT = 'fore:'..colors.blue
lexers.STYLE_CONSTANT = bg..fg
lexers.STYLE_DEFINITION = bg..fg
lexers.STYLE_ERROR = 'fore:'..colors.red..',italics'
lexers.STYLE_FUNCTION = bg..fg
lexers.STYLE_KEYWORD = bg..fg
lexers.STYLE_LABEL = bg..fg
lexers.STYLE_NUMBER = bg..fg
lexers.STYLE_OPERATOR = bg..fg
lexers.STYLE_REGEX = bg..fg
lexers.STYLE_STRING = bg..fg
lexers.STYLE_PREPROCESSOR = bg..fg
lexers.STYLE_TAG = bg..fg
lexers.STYLE_TYPE = bg..fg
lexers.STYLE_VARIABLE = bg..fg
lexers.STYLE_WHITESPACE = ''
lexers.STYLE_EMBEDDED = bg..fg
lexers.STYLE_IDENTIFIER = fg

lexers.STYLE_LINENUMBER = fg
lexers.STYLE_CURSOR = 'fore:'..colors.base03..',back:'..colors.base0
lexers.STYLE_CURSOR_PRIMARY = lexers.STYLE_CURSOR..',back:yellow'
lexers.STYLE_CURSOR_LINE = 'back:'..colors.base02
lexers.STYLE_COLOR_COLUMN = 'back:'..colors.base02
-- lexers.STYLE_SELECTION = 'back:'..colors.base02
lexers.STYLE_SELECTION = 'back:white'
