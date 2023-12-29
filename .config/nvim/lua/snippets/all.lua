return {
	-- auto expansion for pairs
	s("{",
		{
			t({"{","\t"}), 
			i(0), 
			t({"", "}"}),
		}
	),
	s("(",
		{
			t({"{","\t"}), 
			i(0), 
			t({"", ")"}),
		}
	)
}
