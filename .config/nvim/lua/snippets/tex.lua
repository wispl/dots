local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	s({"nn", snippetType="autosnippet"},
		fmta(
			[[
			\begin{<>}
				<>
			\end{<>}
			]],
			{
				i(1),
				i(0),
				rep(1)
			}
		),
		{condition = line_begin}
	)
}
