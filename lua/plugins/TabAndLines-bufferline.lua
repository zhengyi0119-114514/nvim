vim.opt.termguicolors = true
require("bufferline").setup({
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
	diagnostics_indicator = function(count, level, diagnostics_dict, context)
		local s = " "
		for e, n in pairs(diagnostics_dict) do
			local sym = e == "error" and " " or (e == "warning" and " " or " ")
			s = s .. n .. sym
		end
		return s
	end,
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer : nvimtree",
				text_align = "left",
				separator = true,
			},
		},
		highlights = require("catppuccin.groups.integrations.bufferline").get(),
		numbers = function(opts)
			return string.format("%s|%s", opts.id, opts.raise(opts.ordinal))
		end,

		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or " ")
				s = s .. n .. sym
			end
			return s
		end,
	},
})
