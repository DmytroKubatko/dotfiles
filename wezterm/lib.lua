-- Function to merge multiple Lua tables
-- If keys conflict, values from later tables take precedence
-- @param ... any number of tables to merge
-- @return a new table containing all key-value pairs from the input tables
local function mergeTables(...)
	local result = {}

	-- Iterate through all tables passed as arguments
	for _, tbl in ipairs({ ... }) do
		if type(tbl) == "table" then
			-- Copy all key-value pairs from the current table to the result
			for k, v in pairs(tbl) do
				-- If both values are tables, recursively merge them
				if type(result[k]) == "table" and type(v) == "table" then
					result[k] = mergeTables(result[k], v)
				else
					-- Otherwise just overwrite with the new value
					result[k] = v
				end
			end
		end
	end

	return result
end

return { mergeTables = mergeTables }
