package pl.tutajzjem.restaurant.menu

import pl.tutajzjem.security.SecUser;

class WeekMenuAutocomplete {

	String name
	String price
	SecUser user
	
    static constraints = {
		price(nullable: true, blank:true)
    }
	
	static mapping = {
		name length: 1024
	}
}
