package pl.tutajzjem.home

import grails.plugin.springsecurity.SpringSecurityService;
import groovy.json.JsonSlurper;

import org.apache.commons.collections.ListUtils;

import pl.tutajzjem.advertisement.RecommendedService;
import pl.tutajzjem.restaurant.Cuisine;
import pl.tutajzjem.restaurant.Restaurant;
import pl.tutajzjem.restaurant.RestaurantService;
import pl.tutajzjem.restaurant.RestaurantType;
import pl.tutajzjem.restaurant.menu.WeekMenu;
import pl.tutajzjem.search.SearchTZService;

class HomeController {

	static final int MAX_RESULTS = 10
	
	SpringSecurityService springSecurityService
	RestaurantService restaurantService
	RecommendedService recommendedService
	SearchTZService searchTZService
	
    def index() { 
		[bigRecommendedRestaurant:recommendedService.getBigRecommendedRestaurants()]
	}
	
	def search(String q, String category) {
		log.debug("search(q:${q}, category:${category})")
		List<Restaurant> restaurants = searchTZService.search(q, category, null, null, 0, MAX_RESULTS)
		//if there is only one search result -> open it
		if(restaurants.size() == 1) {
			redirect(uri: "/lokal/"+restaurants[0].identifier)
		}
		
		[restaurants:restaurants,
			restaurantTypes:RestaurantType.list(),
			cuisines:Cuisine.list(),
			query: q,
			category: category,
			isNextPage:restaurants.size()==MAX_RESULTS]
	}
	
	def searchAjax(String q, String category, String restaurantType, String cuisine, Long offset) {
		log.debug("search(query:${q}, category:${category}, restaurantType:[${restaurantType}], cuisine:[${cuisine}], offset:${offset})")
		List<Restaurant> restaurants = searchTZService.search(q, category, restaurantType?.tokenize(","), cuisine?.tokenize(","), offset?:0, MAX_RESULTS)
		
		render(template:"searchitem", model:[restaurants:restaurants, isNextPage:restaurants.size()==MAX_RESULTS])
	}
	
	def restaurant(String id) {
		log.debug("restaurant(identifier: ${id})")
		
		springSecurityService.getCurrentUser()
		
		Restaurant restaurant = restaurantService.findByIdentifier(id, springSecurityService.isLoggedIn()?springSecurityService.getCurrentUser():null);
		
		WeekMenu weekMenu = restaurant.getCurrentWeekMenu()
		def weekMenuParsed = weekMenu==null ? null : new JsonSlurper().parseText(weekMenu.menu)
		def permanentMenuParsed = restaurant.permanentMenu==null ? null : new JsonSlurper().parseText(restaurant.permanentMenu.menu)
		
		[restaurant:restaurant,
			weekMenuParsed:weekMenuParsed,
			permanentMenuParsed:permanentMenuParsed]
	}
	
	
}
