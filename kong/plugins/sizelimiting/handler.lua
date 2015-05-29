-- Copyright (C) Mashape, Inc.

local BasePlugin = require "kong.plugins.base_plugin"
local access = require "kong.plugins.sizelimiting.access"

local SizeLimitingHandler = BasePlugin:extend()

function SizeLimitingHandler:new()
  SizeLimitingHandler.super.new(self, "sizelimiting")
end

function SizeLimitingHandler:access(conf)
  SizeLimitingHandler.super.access(self)
  access.execute(conf)
end

SizeLimitingHandler.PRIORITY = 950

return SizeLimitingHandler
