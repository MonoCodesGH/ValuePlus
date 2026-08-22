--!strict
-- Class
const Number = {};

function Number.FormatTime(value: number): (string)
	const days = math.floor(value / 86400);
	local hours = math.floor((value % 86400) / 3600);
	local minutes = math.floor((value % 3600) / 60);
	local seconds = (value % 60);

	if (days > 0) then
		return string.format("%02d:%02d:%02d:%02d", days, hours, minutes, seconds); 
	end

	if (hours > 0) then
		return string.format("%02d:%02d:%02d", hours, minutes, seconds); 
	end

	return string.format("%02d:%02d", minutes, seconds);
end

function Number.FormatCompact(value: number): (string)
	const suffixes = {
		[1_000_000_000_000_000] = "Qd";
		[1_000_000_000_000] = "T";
		[1_000_000_000] = "B";
		[1_000_000] = "M";
		[1_000] = "K";
	};

	for threshold, suffix in (suffixes) do
		if (value >= threshold) then
			return string.format("%.1f%s", value / threshold, suffix);
		end
	end

	return tostring(value);
end

function Number.FormatCommas(value: number): (string)
	const formatted = tostring(value);
	local integer, decimal = formatted:match("^([^%.]+)(.*)$");
	
	if (not integer or not decimal) then
		return formatted;
	end
	
	local sign = "";
	
	if (integer:sub(1, 1) == "-") then
		sign = "-";
		integer = integer:sub(2);
	end
	
	while (true) do
		const replaced, count = integer:gsub("^(%d+)(%d%d%d)", "%1,%2");
		integer = replaced;
		
		if (count == 0) then
			break;
		end
	end
	
	return ("%s%s%s"):format(sign, integer, decimal);
end

function Number.FormatDecimal(value: number, decimals: number): (string)
	return string.format(`%.{decimals}f`, value);
end

function Number.FormatCurrency(value: number, symbol: string): (string)
	return string.format("%s%.2f", symbol, value);
end

function Number.FormatPercentage(value: number, decimals: number?): (string)
	decimals = decimals or 0;
	return string.format(`%.{decimals}f%%`, value);
end

function Number.FormatOrdinal(value: number): (string)
	const suffixes = {
		[1] = "st";
		[2] = "nd";
		[3] = "rd";
	};
	
	const lastTwoDigits = (value % 100);
	if (lastTwoDigits >= 11 and lastTwoDigits <= 13) then
		return string.format("%dth", value);
	end
	
	const suffix = suffixes[value % 10] or "th";
	
	return string.format("%d%s", value, suffix);
end

function Number.FormatRoman(value: number): string
	assert(value == math.floor(value), "Roman numerals require an integer");
	assert(value > 0 and value <= 3999, "Roman numeral must be between 1 and 3999");

	const numerals = {
		{1000, "M"};
		{900, "CM"};
		{500, "D"};
		{400, "CD"};
		{100, "C"};
		{90, "XC"};
		{50, "L"};
		{40, "XL"};
		{10, "X"};
		{9, "IX"};
		{5, "V"};
		{4, "IV"};
		{1, "I"};
	} :: { any }
	
	local result = "";
	
	for _, numeral in (numerals) do
		const amount = numeral[1];
		const symbol = numeral[2];
		const count = math.floor(value / amount);
		
		if (count > 0) then
			result ..= string.rep(symbol, count);
			value %= amount;
		end
	end
	
	return result;
end

function Number.IsInteger(value: number): (boolean)
	return (value == math.floor(value));
end

function Number.IsEven(value: number): (boolean)
	return (value % 2 == 0);
end

function Number.IsOdd(value: number): (boolean)
	return (value % 2 ~= 0);
end

function Number.GetSign(value: number): (number)
	return (value > 0) and 1 or (value < 0) and -1 or 0;
end

function Number.GetPercentage(value: number, max: number): (number)
	return (value / max) * 100;
end

function Number.GetPercentageOf(percent: number, max: number): (number)
	return (percent / 100) * max;
end

function Number.RandomFloat(min: number, max: number): (number)
	return math.random(min * 1000, max * 1000) / 1000;
end

function Number.RandomChance(percent: number): (boolean)
	return (math.random(1, 100) <= percent);
end

function Number.RandomSign(): (number)
	return (math.random(1, 2) == 1) and 1 or -1;
end

return Number;
