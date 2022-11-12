-- Load all config files

require('options')
require('keymaps')
require('commands')
require('plugins')
require('leap').add_default_mappings()
require('themes')  -- Theme at the end, to prevent overwrite by other plugins
