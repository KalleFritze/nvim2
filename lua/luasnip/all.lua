return {
	--umlaute

	s({ trig = ";ae", snippetType = "autosnippet", desc = "ä", wordTrig = false }, { t("ä") }),
	s({ trig = ";ue", snippetType = "autosnippet", desc = "ü", wordTrig = false }, { t("ü") }),
	s({ trig = ";oe", snippetType = "autosnippet", desc = "ö", wordTrig = false }, { t("ö") }),
	s({ trig = "Ae", snippetType = "autosnippet", desc = "Ä", wordTrig = false }, { t("Ä") }),
	s({ trig = "Ue", snippetType = "autosnippet", desc = "Ü", wordTrig = false }, { t("Ü") }),
	s({ trig = "Oe", snippetType = "autosnippet", desc = "Ö", wordTrig = false }, { t("Ö") }),
	s({ trig = ";ss", snippetType = "autosnippet", desc = "ß", wordTrig = false }, { t("ß") }),
	--creating a link
	s(
		{
			trig = "link",
			snippetType = "snippet",
			desc = "create link",
			wordTrig = false,
		},
		fmta(
			[[
		[<>](##<>)
		]],
			{ i(1), rep(1) }
		)
	),
	s(
		{
			trig = "(",
			snippetType = "autosnippet",
			desc = "brackets",
			wordTrig = false,
		},
		fmta(
			[[
		(<>)
		]],
			{ i(1) }
		)
	),
}
