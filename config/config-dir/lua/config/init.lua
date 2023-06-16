require('config/remap')
require('config/set')
require('config/vimwiki')

local onedark = require('onedark');

require('onedark').setup {
  style = 'cool',
  transparent = true,
  term_colors = true,
}
require('onedark').load()
