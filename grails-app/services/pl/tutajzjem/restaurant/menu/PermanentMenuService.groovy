package pl.tutajzjem.restaurant.menu

import grails.transaction.Transactional
import groovy.json.JsonBuilder;

import org.apache.commons.lang.StringUtils;
import org.codehaus.groovy.grails.web.json.JSONArray

import pl.tutajzjem.restaurant.Restaurant
import pl.tutajzjem.security.SecUser

@Transactional
class PermanentMenuService {

    Set<PermanentMenuCategory> parse(def data) {
		Set<PermanentMenuCategory> categorySet = new HashSet<PermanentMenuCategory>()
		
		def jsonMenu = new JSONArray(data)
		for (jsonCategory in jsonMenu) {
			def category 			= new PermanentMenuCategory()
			category.name 			= jsonCategory.name
			category.position 		= jsonCategory.position
			
			for (jsonItem in jsonCategory.items) {
				def item 			= new PermanentMenuItem()
				item.name 			= jsonItem.name
				item.position 		= jsonItem.position
				item.description 	= jsonItem.description
				item.price 			= jsonItem.price
				category.addToItems(item)
			}
			categorySet.add(category)
		}
		return categorySet
    }
	
	String convertToJSON(PermanentMenu menu) {
		if(menu == null || menu.categories==null || menu.categories.isEmpty()) {
			return StringUtils.EMPTY
		}
		def catList = []
		for (category in menu.categories ) {
			catList.add([name:"dd", position:"1", items:[[name:"t1"],[name:"t2"]]]) 
		}
		return new JsonBuilder(catList).toString() 
	}
	
	Restaurant updateRestaurantMenu(Restaurant restaurant, String jsonMenu, SecUser originator) {
		if(restaurant.permanentMenu != null) {
			def m = restaurant.permanentMenu
			restaurant.permanentMenu = null
			m.delete(flush:true);
		}
		restaurant.permanentMenu = new PermanentMenu(originator: originator, menu:jsonMenu)
		restaurant.permanentMenu.categories = parse(jsonMenu)
		restaurant.save(flush:true)
	}
	
}
