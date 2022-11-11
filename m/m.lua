-- stateful to make it quicker to use

local M = {}

M.reloadables = {}
local debug = sys.get_engine_info().is_debug

function M.reloadable(path)
	if debug then
		-- if the engine is in debug mode then save the
		print(path .. " is in debug mode")

		-- get a table for the module
		local t = M.reloadables[path] or {}
		
		-- purge everything in the table to not have any residual functions
		for k, v in pairs(t) do
			t[k] = nil
		end

		-- keep a reference to the table
		M.reloadables[path] = t
		
		return M.reloadables[path]
	else
		return {}
	end
end

-- make it callable like m(...)
local mt = { __call = function(_, path) return M.reloadable(path) end } 
setmetatable(M, mt)


return M