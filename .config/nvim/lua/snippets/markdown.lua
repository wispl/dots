return {
	s("meta",
		{
			t({"---", ""}),
			t("title: "), i(1),
			t({"", "date: " .. os.date("%Y %b %d"), ""}),
			t({"tags:", ""}),
			i(0),
			t("---")
		}
	)
}
