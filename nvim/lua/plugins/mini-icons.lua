return {
	"mini.icons",
	after = function()
		require("mini.icons").setup()
		MiniIcons.mock_nvim_web_devicons()
	end,
	lazy = true,
}
