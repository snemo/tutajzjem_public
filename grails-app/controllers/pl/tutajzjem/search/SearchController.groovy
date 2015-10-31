package pl.tutajzjem.search

import grails.converters.JSON;
import pl.tutajzjem.restaurant.Restaurant;

class SearchController {

	SearchTZService searchTZService
	
    def autocomplete(String query) {
		render searchTZService.autocomplete(query) as JSON
	}
	
}
