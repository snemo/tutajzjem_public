package pl.tutajzjem.search

import org.apache.commons.collections.ListUtils;

import pl.tutajzjem.restaurant.Restaurant;
import pl.tutajzjem.restaurant.RestaurantStatus;
import grails.transaction.Transactional

@Transactional
class SearchTZService {

	static final String CATEGORY_CITY = "city"
	static final String CATEGORY_RESTAURANT = "restaurant"
	
    def autocomplete(String query) {
		def restaurants = Restaurant.createCriteria().list {
			and {
				ilike("name", "%${query}%")
				eq("status", RestaurantStatus.ACTIVE)
			}
			order "name", "desc"
			maxResults 5
			projections {
				property "name"
			}
		}
		
		def cities = Restaurant.createCriteria().list {
			and {
				ilike("city", "%${query}%")
				eq("status", RestaurantStatus.ACTIVE)
			}
			order "city", "desc"
			maxResults 5
			projections {
				distinct "city"
			}
		}
		
		List result = new ArrayList()
		cities.each {result.add([label:it, category:CATEGORY_CITY])}
		restaurants.each {result.add([label:it, category:CATEGORY_RESTAURANT])}
		return result
    }
	
	List<Restaurant> search(String query, String category, List<String> restaurantType, List<String> cuisine, long offset, int max) {
		log.debug("search(query:${query}, category:${category}, restaurantType:${restaurantType}, cuisine:${cuisine}, offset:${offset}, max:${max})")
		List<Restaurant> restaurants = ListUtils.EMPTY_LIST
		restaurants = Restaurant.createCriteria().list(max:max, offset:offset) {
			and {
				eq("status", RestaurantStatus.ACTIVE)
				
				if(category == CATEGORY_CITY) {
					ilike("city", "%${query}%")
				} else if(category == CATEGORY_RESTAURANT) {
					ilike("name", "%${query}%")
				}
				else {
					or {
						ilike("name", "%${query}%")
						ilike("city", "%${query}%")
					}
				}
				if(restaurantType!=null) {
					or {
						restaurantType.each {  
							ilike("typesList", "%${it}%")
						}
					}
				}
				if(cuisine!=null) {
					or {
						cuisine.each {
							ilike("cuisinesList", "%${it}%")
						}
					}
				}
			}
			order "name", "asc"
		}
			
		return restaurants	
	}
	
}
