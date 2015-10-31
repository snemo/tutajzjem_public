package pl.tutajzjem.restaurant.menu

import grails.plugin.springsecurity.SpringSecurityService
import pl.tutajzjem.restaurant.Restaurant
import pl.tutajzjem.restaurant.RestaurantService;


class PermanentmenuController {
	
	SpringSecurityService springSecurityService
	PermanentMenuService permanentMenuService
	RestaurantService restaurantService

	def edit(String id) {
		Restaurant restaurant = restaurantService.findByIdentifierForEdit(id, springSecurityService.getCurrentUser())
		[restaurant:restaurant]
	}
	
	def save(String id) {
		Restaurant restaurant = restaurantService.findByIdentifierForEdit(id, springSecurityService.getCurrentUser())
		permanentMenuService.updateRestaurantMenu(restaurant, params.data, springSecurityService.currentUser)
		redirect controller:"manager", action:"index"
	}
	
}
