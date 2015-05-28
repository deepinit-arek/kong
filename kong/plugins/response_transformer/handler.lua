local BasePlugin = require "kong.plugins.base_plugin"
local body_filter = require "kong.plugins.response_transformer.body_filter"

local ResponseTransformerHandler = BasePlugin:extend()

function ResponseTransformerHandler:new()
  ResponseTransformerHandler.super.new(self, "response_transformer")
end

function ResponseTransformerHandler:body_filter(conf)
  ResponseTransformerHandler.super.body_filter(self)
  body_filter.execute(conf)
end

ResponseTransformerHandler.PRIORITY = 800

return ResponseTransformerHandler
