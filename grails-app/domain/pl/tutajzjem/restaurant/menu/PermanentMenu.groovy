package pl.tutajzjem.restaurant.menu

import java.util.Date;

import pl.tutajzjem.restaurant.Restaurant;
import pl.tutajzjem.security.SecUser;

class PermanentMenu {

	SecUser originator
	String menu
	
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [categories:PermanentMenuCategory]
	static belongsTo = Restaurant
	
    static constraints = {
		menu(nullable: true, blank:true)
    }
	
	static mapping = {
		categories cascade: 'all-delete-orphan', lazy:true
		menu length: 32768 
	}
}
