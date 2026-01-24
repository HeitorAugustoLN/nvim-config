return {
	"blink.cmp",
	after = function()
		require("blink.cmp").setup({
			cmdline = { completion = { menu = { auto_show = true } } },
			completion = { ghost_text = { enabled = true } },
			signature = { enabled = true },
		})
	end,
  event = { "CmdlineEnter", "InsertEnter" },
}
