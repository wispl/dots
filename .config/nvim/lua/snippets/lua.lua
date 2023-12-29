return {
	s("fn",
		{
			t("function "), i(1), t("("), i(2), t({")", "\t"}),
			i(0),
			t({"", "end"})
		}
	),
	s("while",
		{
			t("while "), i(1), t({"do", "\t"}), 
			i(0),
			t({"", "end"})
		}
	),
	s("for",
		{
			t("for "), i(1), t({"do", "\t"}), 
			i(0),
			t({"", "end"})
		}
	),
	s("if",
		{
			t("if "), i(1), t({"then", "\t"}), 
			i(0),
			t({"", "end"})
		}
	),
}
