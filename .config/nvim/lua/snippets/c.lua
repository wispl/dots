return {
	s("fn",
		{
			i(1, "void"), t(" "), i(2, "fn"), t("("), i(3), t(")"),
			t({"", "{", "\t"}),
			i(0),
			t({"", "}"})
		}
	),

	s("df",
		{
			i(1, "void"), t(" "), i(2, "fn"), t("("), i(3), t(");")
		}
	),

	s("if",
		{
			t("if ("), i(1), t({") {", "\t"}),
			i(0),
			t({"", "}"})
		}
	),

	s("while",
		{
			t("while ("), i(1), t({") {", "\t"}),
			i(0),
			t({"", "}"})
		}
	),

	s("switch",
		{
			t("switch "), i(1), t({" {", ""}),
			i(0),
			t({"", "}"})
		}
	),

	s("struct",
		{
			t("struct "), i(1), t({" {", "\t"}),
			i(0),
			t({"", "};"})
		}
	)
}
