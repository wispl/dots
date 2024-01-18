local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- might move this out later if there are uses else where
function get_visual(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ""))
  end
end

return {
	s({ trig = "=>", snippetType = "autosnippet" }, { t("\\implies") }),
	s({ trig = "...", snippetType = "autosnippet" }, { t("\\ldots") }),

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
			{ i(0), }
		),
		{ condition = line_begin }
	),

	s({ trig = "item", snippetType = "autosnippet" },
		fmta(
			[[
				\begin{item}
					\item <>
				\end{item}
			]],
			{ i(0), }
		),
		{ condition = line_begin }
	),

	s({ trig = "dm", snippetType = "autosnippet" },
		fmta(
			[[
				\[
					<>
				\]<>
			]],
			{ d(1, get_visual), i(0) }
		)
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

	s({ trig = "mk", snippetType = "autosnippet" }, { t("$"), i(1), t("$"), i(0) })
}
