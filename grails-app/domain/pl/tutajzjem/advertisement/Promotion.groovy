package pl.tutajzjem.advertisement

import java.util.Date;

import pl.tutajzjem.restaurant.Restaurant;
import pl.tutajzjem.security.SecUser;

class Promotion {
	
	Restaurant restaurant
	byte promotionRank
	
	Date validityFrom
	Date validityTo
	
	SecUser originator
	Date dateCreated
	Date lastUpdated

    static constraints = {
    }
}
