package pl.tutajzjem.advertisement

import pl.tutajzjem.restaurant.Restaurant;
import grails.transaction.Transactional

@Transactional
class RecommendedService {
	
	static final int MAX_RECOMMENDED = 3

    List<Recommended> getBigRecommendedRestaurants() {
		def crit = Recommended.createCriteria()
		return crit.list(max:MAX_RECOMMENDED) {
			order("dateCreated", "desc")
		}
	}
	
	
}
