local cjson = require "cjson"
local basic_serializer = require "kong.plugins.log_serializers.basic"

local _M = {}

-- Log to a file
-- @param `premature`
-- @param `conf`     Configuration table, holds http endpoint details
-- @param `message`  Message to be logged
local function log(premature, conf, message)
  local f = io.open(conf.path, "a+")
  f:write(cjson.encode(message).."\n")
  f:close()
end

function _M.execute(conf)
  local message = basic_serializer.serialize(ngx)

  local ok, err = ngx.timer.at(0, log, conf, message)
  if not ok then
    ngx.log(ngx.ERR, "[filelog] failed to create timer: ", err)
  end
end

return _M
