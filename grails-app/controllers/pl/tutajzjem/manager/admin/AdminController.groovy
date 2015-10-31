package pl.tutajzjem.manager.admin

import pl.tutajzjem.advertisement.RecommendedService;
import pl.tutajzjem.restaurant.Restaurant;
import pl.tutajzjem.security.SecUser;

class AdminController {
	
	RecommendedService recommendedService

    def index() { 
		[ userList:SecUser.list(), 
		  restaurantList:Restaurant.list(sort:"status", order:"desc") ]
	}
	
	
	def recommended() {
		
	}
	
}
