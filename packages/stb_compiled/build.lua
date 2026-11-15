modules = {
	"image",
	"image_resize",
}

for _, module in ipairs(modules) do
	header_file = "stb_" .. module .. ".h"
	include_path = "stb/" .. header_file
	macro = string.upper("STB_" .. module .. "_IMPLEMENTATION")
	print(header_file)
	print(include_path)
	print(macro)
end
