// Place your Spring DSL code here
beans = {
	
	localeResolver(org.springframework.web.servlet.i18n.SessionLocaleResolver) {
		defaultLocale = new Locale("pl","PL")
		java.util.Locale.setDefault(defaultLocale)
	 }
}
