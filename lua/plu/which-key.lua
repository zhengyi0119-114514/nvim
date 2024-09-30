local wk = require("which-key")
wk.add({
	{ "<leader>o", desc = "Overseer Code Tools" },
	{ "<leader>t", desc = "NvimTree File Explorer" },
	{ "<leader>b", desc = "BufferLine" },
	{ "<leader>bm", desc = "Move Buffer"},
	{ "<leader>bc", desc = "Choose Buffer"},
	{ "<leader>s", desc = "Symbol" },
	{ "<leader>f", desc = "Find" },
})
return function(mode, key, cmd, desc)
	wk.add({
		key,
		cmd,
		mode = mode,
		desc = desc,
	})
end
