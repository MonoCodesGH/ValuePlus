--!strict
-- Class
const String = {};

function String.FormatCapitalized(value: string): (string)
	if (#value == 0) then
		return value;
	end

	return value:sub(1, 1):upper() .. value:sub(2);
end

function String.FormatCamelCase(value: string): (string)
	const words = string.split(value, "[^%w]+");

	if (#words == 0) then
		return "";
	end

	local result = words[1]:lower();

	for index = 2, #words do
		result ..= String.FormatCapitalized(words[index]:lower());
	end

	return result;
end

function String.FormatSnakeCase(value: string): (string)
	value = value:gsub("(%u)", "_%1");
	value = value:gsub("[%s%-]+", "_");

	return (value:lower():gsub("^_", ""));
end

function String.FormatKebabCase(value: string): (string)
	const result = String.FormatSnakeCase(value):gsub("_", "-");
	return result;
end

function String.FormatSingular(value: string): (string)
	if (value:sub(1, value:len() - 1):lower() == 's') then
		return value:sub(1, value:len() - 1);
	end
	
	return value;
end

function String.FormatPlural(value: string, capitialize: boolean?): (string)
	return ("%s%s"):format(
		value,
		(capitialize == true) and "S" or "s"
	);
end

function String.IsEmpty(value: string): (boolean)
	return (value == "");
end

function String.IsBlank(value: string): (boolean)
	return (value:match("^%s*$") ~= nil);
end

function String.IsNumber(value: string): (boolean)
	return (tonumber(value) ~= nil);
end

function String.IsInteger(value: string): (boolean)
	return (value:match("^[+-]?%d+$") ~= nil);
end

function String.IsDecimal(value: string): (boolean)
	return (tonumber(value) ~= nil and value:find("%.") ~= nil);
end

function String.StartsWith(value: string, prefix: string): (boolean)
	return (value:sub(1, #prefix) == prefix);
end

function String.EndsWith(value: string, suffix: string): (boolean)
	return (suffix == "" or value:sub(-#suffix) == suffix);
end

function String.Contains(value: string, search: string): (boolean)
	return (string.find(value, search, 1, true) ~= nil);
end

function String.Trim(value: string): (string)
	return value:match("^%s*(.-)%s*$") or "";
end

function String.TrimStart(value: string): (string)
	return value:match("^%s*(.*)$") or "";
end

function String.TrimEnd(value: string): (string)
	return value:match("^(.-)%s*$") or "";
end

return String;
