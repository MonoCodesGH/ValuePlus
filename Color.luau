--!strict
-- Class
const Color = {
	Colors = table.freeze({
		RED = Color3.fromRGB(255, 0, 0);
		ORANGE = Color3.fromRGB(255, 127, 0);
		YELLOW = Color3.fromRGB(255, 255, 0);
		GREEN = Color3.fromRGB(0, 255, 0);
		BLUE = Color3.fromRGB(0, 0, 255);
		PURPLE = Color3.fromRGB(127, 0, 255);
		PINK = Color3.fromRGB(255, 0, 255);
		WHITE = Color3.fromRGB(255, 255, 255);
		BLACK = Color3.fromRGB(0, 0, 0);
	});
};

function Color.Lerp(color1: Color3, color2: Color3, alpha: number): (Color3)
	return color1:Lerp(color2, alpha);
end

function Color.Darken(color: Color3, amount: number): (Color3)
	return color:Lerp(Color.Colors.BLACK, amount);
end

function Color.Lighten(color: Color3, amount: number): (Color3)
	return color:Lerp(Color.Colors.WHITE, amount);
end

function Color.Mix(colors: { Color3 }): (Color3)
	local r = 0;
	local g = 0;
	local b = 0;
	
	for _, color in (colors) do
		r += color.R;
		g += color.G;
		b += color.B;
	end
	
	return Color3.fromRGB(r / #colors, g / #colors, b / #colors);
end

function Color.Invert(color: Color3): (Color3)
	return Color3.new(
		1 - color.R,
		1 - color.G,
		1 - color.B
	);
end

function Color.Grayscale(color: Color3): (Color3)
	const value = (0.299 * color.R + 0.587 * color.G + 0.114 * color.B);
	return Color3.new(value, value, value);
end

return Color;
