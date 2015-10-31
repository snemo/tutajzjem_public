package pl.tutajzjem.restaurant.menu

import grails.plugin.springsecurity.SpringSecurityService;
import pl.tutajzjem.restaurant.Restaurant;
import pl.tutajzjem.restaurant.RestaurantService;
import grails.converters.JSON;

class WeekmenuController {
	
	SpringSecurityService springSecurityService
	WeekMenuService weekMenuService
	RestaurantService restaurantService

    def edit(String id, String yearweek) { 
		Restaurant restaurant = restaurantService.findByIdentifierForEdit(id, springSecurityService.getCurrentUser())
		WeekMenu weekMenu = WeekMenu.findByRestaurantAndYearWeek(restaurant, yearweek)
		
		[restaurant:restaurant, 
		weekMenu:weekMenu?:new WeekMenu(yearWeek: yearweek),
		weekSelector: weekMenuService.generateWeekSelector(yearweek)]
	}
	
	def save(Restaurant rest, String yearWeek, String data) {
		Restaurant restaurant = restaurantService.findByIdentifierForEdit(rest.identifier, springSecurityService.getCurrentUser())
		
		weekMenuService.updateRestaurantMenu(restaurant, data, yearWeek, springSecurityService.getCurrentUser())
		redirect controller:"manager", action:"index"
	}
	
	def autocomplete(String term) {
		render weekMenuService.autocompleteSearch(term, springSecurityService.getCurrentUser()) as JSON
	}
}
