require "custom.configs.mappings"
-- require "custom.configs.plugins"

--[[

local custom_plugins = require("custom.configs.plugins")

local config = require("core.utils").load_config()

if #config.plugins > 0 then
  table.insert(custom_plugins, { import = config.plugins })
end

require("lazy").setup(custom_plugins, config.lazy_nvim)
--]]
