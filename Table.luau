--!strict
-- Types
type TableObj = { [any]: any };

-- Class
const Table = {};

function Table.DeepCopy(tbl: TableObj): (TableObj)
	assert(typeof(tbl) == "table", `Expected table, got {typeof(tbl)}`);
	
	const copy = {};
	
	for key, value in (tbl) do
		if (typeof(value) == "table") then
			copy[key] = Table.DeepCopy(value);
		else
			copy[key] = value;
		end
	end
	
	return copy;
end

function Table.DeepFreeze(tbl: TableObj): (TableObj)
	assert(typeof(tbl) == "table", `Expected table, got {typeof(tbl)}`);
	
	for key, value in (tbl) do
		if (typeof(value) == "table") then
			Table.DeepFreeze(value);
		end
	end
	
	return table.freeze(tbl);
end

function Table.DeepPrint(tbl: TableObj, prefix: string?): ()
	assert(typeof(tbl) == "table", `Expected table, got {typeof(tbl)}`);
	
	prefix = prefix or "";
	
	for key, value in tbl do
		local path = prefix == "" and tostring(key) or `{prefix}.{key}`;
		
		if (typeof(value) == "table") then
			Table.DeepPrint(value, path);
		else
			print(("Key: %* | Value: %*"):format(path, value));
		end
	end
end

function Table.DeepMerge(first: TableObj, second: TableObj): (TableObj)
	assert(typeof(first) == "table", `Expected first table, got {typeof(first)}`);
	assert(typeof(second) == "table", `Expected second table, got {typeof(second)}`);
	
	for key, value in (second) do
		if (typeof(value) == "table" and typeof(first[key]) == "table") then
			Table.DeepMerge(first[key], value);
		else
			first[key] = (typeof(value) == "table") and Table.DeepCopy(value) or value;
		end
	end
	
	return first;
end

function Table.DeepEquals(first: TableObj, second: TableObj): (boolean)
	assert(typeof(first) == "table", `Expected first table, got {typeof(first)}`);
	assert(typeof(second) == "table", `Expected second table, got {typeof(second)}`);
	
	for key, value in (first) do
		const other = second[key];
		
		if (typeof(value) == "table" and typeof(other) == "table") then
			if (not Table.DeepEquals(value, other)) then
				return false;
			end
		elseif (value ~= other) then
			return false;
		end
	end
	
	for key in (second) do
		if (first[key] == nil) then
			return false;
		end
	end
	
	return true;
end

function Table.ShallowCopy(tbl: TableObj): (TableObj)
	assert(typeof(tbl) == "table", `Expected table, got {typeof(tbl)}`);
	
	const copy = {};
	
	for key, value in (tbl) do
		copy[key] = value;
	end
	
	return copy;
end

function Table.ShallowMerge(first: TableObj, second: TableObj): (TableObj)
	assert(typeof(first) == "table", `Expected first table, got {typeof(first)}`);
	assert(typeof(second) == "table", `Expected second table, got {typeof(second)}`);
	
	const result = Table.ShallowCopy(first);
	
	for key, value in (second) do
		result[key] = value;
	end
	
	return result;
end

function Table.Contains(tbl: TableObj, value: any): (boolean)
	assert(typeof(tbl) == "table", `Expected table, got {typeof(tbl)}`);
	
	for _, entry in (tbl) do
		if (entry == value) then
			return true;
		end
	end
	
	return false;
end

function Table.Find(tbl: TableObj, value: any): (any?)
	assert(typeof(tbl) == "table", `Expected table, got {typeof(tbl)}`);
	
	for key, entry in (tbl) do
		if (entry == value) then
			return key;
		end
	end
	
	return nil;
end

function Table.IsEmpty(tbl: TableObj): (boolean)
	assert(typeof(tbl) == "table", `Expected table, got {typeof(tbl)}`);
	
	return next(tbl) == nil;
end

function Table.GetKeys(tbl: TableObj): ({ any })
	assert(typeof(tbl) == "table", `Expected table, got {typeof(tbl)}`);
	
	const keys = {};
	
	for key in (tbl) do
		table.insert(keys, key);
	end
	
	return keys;
end

function Table.GetValues(tbl: TableObj): ({ any })
	assert(typeof(tbl) == "table", `Expected table, got {typeof(tbl)}`);
	
	const values = {};
	
	for _, value in (tbl) do
		table.insert(values, value);
	end
	
	return values;
end

function Table.Reverse(tbl: { any }): { any }
	assert(typeof(tbl) == "table", `Expected table, got {typeof(tbl)}`);
	
	const reversed = {};
	
	for index = #tbl, 1, -1 do
		table.insert(reversed, tbl[index]);
	end
	
	return reversed;
end

return Table;
