
local _M = {}


local function retrieve_headers(request, conf)
  local headers = request.get_headers()
  print(table.concat(headers, ", "))
  ngx.log(ngx.ERR, table.concat(headers, ", "))
end



-- Api specific size limiting, reject request if payload size is greater than specified size
--
-- All methods must respect:
-- @param {table} `conf` Configuration table
-- @return {boolean} True if payload size is acceptable 
function _M.execute(conf)
  ngx.log(ngx.ERR, "inside size limiting")
  if not conf then return false end
  retrieve_headers(ngx.req, conf)
end

return _M
