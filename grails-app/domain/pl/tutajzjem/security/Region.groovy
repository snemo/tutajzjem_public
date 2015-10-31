package pl.tutajzjem.security

enum Region {

	DOLNOSLASKIE("dolnośląskie"),
	KUJAWSKO_POMORSKIE("kujawsko-pomorskie"),
	LUBELSKIE("lubelskie"),
	LUBUSKIE("lubuskie"),
	LODZKIE("łódzkie"),
	MALOPOLSKIE("małopolskie"),
	MAZOWIECKIE("mazowieckie"),
	OPOLSKIE("opolskie"),
	PODKARPACKIE("podkarpackie"),
	PODLASKIE("podlaskie"),
	POMORSKIE("pomorskie"),
	SLASKIE("śląskie"),
	SWIETOKRZYSKIE("świętokrzyskie"),
	WARMINSKO_MAZURSKIE("warmińsko-mazurskie"),
	WIELKOPOLSKIE("wielkopolskie"),
	ZACHODNIOPOMORSKIE("zachodniopomorskie")
	
	final defaultTranslation
	
	Region(String translation) {
		this.defaultTranslation = translation
	}
	
	public String toString() {
		return this.defaultTranslation
	}
}
