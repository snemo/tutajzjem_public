package pl.tutajzjem.manager.admin

import pl.tutajzjem.advertisement.Recommended;
import pl.tutajzjem.restaurant.Restaurant;

class RecommendedController {

    def index() { 
		
		[ restaurantList:Restaurant.list(),
		  recommendedList:Recommended.list()]
	}
	
	def add(Recommended recommended) {
		recommended.save(flush:true)
		render "ok"
	}
	
	def delete(Recommended recommended) {
		recommended.delete(flush:true);
		redirect action:"index"
	}
	
}
