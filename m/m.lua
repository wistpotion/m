-- stateful to make it quicker to use

local M = {}

M.reloadables = {}
local debug = sys.get_engine_info().is_debug

function M.reloadable(path)
	if debug then
		print(path .. " is in debug mode")
		M.reloadables[path] = M.reloadables[path] or {}
		return M.reloadables[path]
	else
		return {}
	end
end


local mt = { __call = function(_, path) return M.reloadable(path) end } --make it callable like m()
setmetatable(M, mt)


return M