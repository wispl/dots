return {
	s("meta",
		{
			t({"---", ""}),
			t("title: "), i(1),
			t({"", "date: " .. os.date("%Y-%m-%d"), ""}),
			t({"tags:", ""}),
			i(0),
			t("---")
		}
	)
}
