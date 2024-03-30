function get_visual(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ""))
  end
end

local line_begin = require("luasnip.extras.expand_conditions").line_begin
local in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end

return {
	-- Environments
	s({ trig = "beg", snippetType = "autosnippet" },
		fmta(
			[[
				\begin{<>}
					<>
				\end{<>}
			]],
			{ i(1), i(0), rep(1) }
		),
		{ condition = line_begin }
	),

	s("fig",
		fmta(
			[[
				\begin{figure}{<>}
					\centering
					<>
					\captioning{<>}
				\end{figure}
			]],
			{ i(1, "h"), i(0), i(2) }
		),
		{ condition = line_begin }
	),

	s({ trig = "enum", snippetType = "autosnippet" },
		fmta(
			[[
				\begin{enumerate}
					\item <>
				\end{enumerate}
			]],
			{ i(0) }
		),
		{ condition = line_begin }
	),
	s({ trig = "item", snippetType = "autosnippet" },
		fmta(
			[[
				\begin{itemize}
					\item <>
				\end{itemize}
			]],
			{ i(0) }
		),
		{ condition = line_begin }
	),

	s({ trig = "mk", snippetType = "autosnippet" }, { t("$"), i(1), t("$"), i(0) }),
	s({ trig = "dm", snippetType = "autosnippet" },
		fmta(
			[[
				\[
					<>
				\]
			]],
			{ d(1, get_visual) }
		),
		{ condition = line_begin }
	),
	s({ trig = "ali", snippetType = "autosnippet" },
		fmta(
			[[
				\begin{align}
					<>
				\end{align}
			]],
			{ i(0) }
		),
		{ condition = line_begin }
	),

	-- Math context
	-- Symbols
	s({ trig = ">>", snippetType = "autosnippet" },
		{ t("\\gg") },
		{ condition = in_mathzone }
	),
	s({ trig = "<<", snippetType = "autosnippet" },
		{ t("\\ll") },
		{ condition = in_mathzone }
	),
	s({ trig = ">=", snippetType = "autosnippet" },
		{ t("\\ge") },
		{ condition = in_mathzone }
	),
	s({ trig = "<=", snippetType = "autosnippet" },
		{ t("\\le") },
		{ condition = in_mathzone }
	),
	s({ trig = "!=", snippetType = "autosnippet" },
		{ t("\\neq") },
		{ condition = in_mathzone }
	),
	s({ trig = "==", snippetType = "autosnippet" },
		{ t("&=") },
		{ condition = in_mathzone }
	),
	s({ trig = "=>", snippetType = "autosnippet" },
		{ t("\\implies") },
		{ condition = in_mathzone }
	),
	s({ trig = "...", snippetType = "autosnippet" },
		{ t("\\ldots") },
		{ condition = in_mathzone }
	),
	s({ trig = "ooo", snippetType = "autosnippet" },
		{ t("\\infty") },
		{ condition = in_mathzone }
	),
	s({ trig = "lim", snippetType = "autosnippet" },
		fmta("\\lim_{<> \\to <>}", { i(1, "n"), i(2, "\\infty") }),
		{ condition = in_mathzone }
	),
	s({ trig = "sum", snippetType = "autosnippet" },
		fmta("\\sum_{n = <>}^{<>}", { i(1, "1"), i(2, "\\infty") }),
		{ condition = in_mathzone }
	),
	s({ trig = "(%a)hat", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("\\hat{<>}", { f(function(_, snip) return snip.captures[1] end) }),
		{ condition = in_mathzone }
	),
	s({ trig = "(%a)bar", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("\\overline{<>}", { f(function(_, snip) return snip.captures[1] end) }),
		{ condition = in_mathzone }
	),
	s({ trig = "sq", wordTrig = false, snippetType = "autosnippet" },
		fmta("\\sqrt{<>}", { i(1) }),
		{ condition = in_mathzone }
	),
	s({ trig = "dint", wordTrig = false, snippetType = "autosnippet" },
		fmta(
			"\\int_{<>}^{<>} <>",
			{
				i(1, ""), i(2, ""), i(0)
			}
		),
		{ condition = in_mathzone }
	),

	-- Subscripts and Superscripts
	s({ trig = "_", wordTrig = false, snippetType = "autosnippet" },
		fmta("_{<>}<>", { i(1), i(0) } ),
		{ condition = in_mathzone }
	),
	s({ trig = "td", wordTrig = false, snippetType = "autosnippet" },
		fmta("^{<>}<>", { i(1), i(0) }),
		{ condition = in_mathzone }
	),
	-- |shortcut| subscript for letter followed by number a0 -> a_{0}
	s({ trig = "(%a)(%d)", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta(
			"<>_{<>}",
			{
				f(function(_, snip) return snip.captures[1] end),
				f(function(_, snip) return snip.captures[2] end),
			}
		),
		{ condition = in_mathzone }
	),
	-- |shortcut| cubes and squares
	s({ trig = "sr", wordTrig = false, snippetType = "autosnippet" },
		{ t("^{2}") },
		{ condition = in_mathzone }
	),
	s({ trig = "cb", wordTrig = false, snippetType = "autosnippet" },
		{ t("^{3}") },
		{ condition = in_mathzone }
	),
	-- Fractions
	s({ trig = "//", wordTrig = false, snippetType = "autosnippet" },
		fmta("\\frac{<>}{<>}<>", { i(1), i(2), i(0) }),
		{ condition = in_mathzone }
	),
	-- |shortcut| (a + b + (f*3)) -> \frac{a + b + (f*3)}{}
	s({ trig="(%b())/", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta(
			"\\frac{<>}{<>}<>",
			{
				f(function (_, snip) return snip.captures[1]:sub(2, -2) end),
				i(1),
				i(0)
			}
		),
		{ condition = in_mathzone }
	),
	-- TODO: this might need to be modified
	-- |shortcut| expression -> \frac{expression}{}, no spaces though
	s({ trig="([^%s$]+)/", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta(
			"\\frac{<>}{<>}<>",
			{
				f(function (_, snip) return snip.captures[1] end),
				i(1),
				i(0)
			}
		),
		{ condition = in_mathzone }
	)
}
