return {
	{
		"rebelot/kanagawa.nvim",
		opts = {
			compiled = true,	
			transparent = true,
			colors = {
				theme = {
					all = {
						ui = { bg_gutter = "none" }
					}
				}
			},
			background = { dark = "dragon", light = "lotus" },
			overrides = function(colors)
				local theme = colors.theme
				return {
					StatusNormal = { bg = theme.syn.fun, fg = theme.ui.bg_m3 },
					StatusInsert = { bg = theme.diag.ok, fg = theme.ui.bg },
					StatusVisual = { bg = theme.syn.keyword, fg = theme.ui.bg },
					StatusReplace = { bg = theme.syn.constant, fg = theme.ui.bg },
					StatusCommand = { bg = theme.syn.operator, fg = theme.ui.bg },
					StatusTerminal = { bg = theme.syn.fun, fg = theme.ui.bg_m3 },

					-- better border highlights
					FloatBorder = { fg = theme.ui.float.fg_border, bg = theme.ui.bg },
					NormalFloat = { fg = theme.ui.float.fg, bg = theme.ui.bg },

					WinSeparator = { fg = theme.ui.bg_p2 },
					DashboardHeader = { fg = theme.syn.comment },
				}
			end
		},
	},
}
