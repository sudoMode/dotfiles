-- @type ChadrcConfig
local M = {}

M.plugins  = 'custom.plugins'
M.mappings = require 'custom.mappings'
M.ui = {
  theme = 'ayu_dark',
  theme_toggle = {'ayu_dark', 'ayu_dark'},
  statusline = {
    theme = 'default',
    separator_style = 'round',
    overriden_modules = function()
      local st_modules = require "nvchad_ui.statusline.default"
      return {
        mode = function()
          return st_modules.mode()
        end,
      }
    end,
  },
  nvdash = {
    load_on_startup = true
  },
  transparency = false,
  telescope = {
    style = 'borderless'
  },
}
return M
