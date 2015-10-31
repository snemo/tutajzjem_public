package pl.tutajzjem.restaurant.menu

import org.apache.commons.lang.StringUtils;

import pl.tutajzjem.restaurant.Restaurant;
import pl.tutajzjem.restaurant.RestaurantUtils;
import pl.tutajzjem.security.SecUser;
import grails.transaction.Transactional
import groovy.json.JsonSlurper;

@Transactional
class WeekMenuService {

    Restaurant updateRestaurantMenu(Restaurant restaurant, String jsonMenu, String yearWeek, SecUser originator) {
		updateLunchOpenHours(restaurant, jsonMenu)
		updateAutocomplete(restaurant, jsonMenu)
		
		WeekMenu weekMenu = WeekMenu.findByRestaurantAndYearWeek(restaurant, yearWeek)
		if (weekMenu == null) {
			weekMenu = new WeekMenu(menu: jsonMenu, 
									yearWeek: yearWeek, 
									originator: originator )
			restaurant.addToWeekMenus(weekMenu)
		} else {
			weekMenu.menu = jsonMenu;
		}
		restaurant.save(flush:true);
	}
	
	List<WeekMenu> generateWeekSelector(String yearWeek) {
		List<WeekMenu> menus = new ArrayList<WeekMenu>()
		menus.add(new WeekMenu(yearWeek: MenuUtils.addWeek(yearWeek, -2)))
		menus.add(new WeekMenu(yearWeek: MenuUtils.addWeek(yearWeek, -1)))
		menus.add(new WeekMenu(yearWeek: yearWeek))
		menus.add(new WeekMenu(yearWeek: MenuUtils.addWeek(yearWeek, 1)))
		menus.add(new WeekMenu(yearWeek: MenuUtils.addWeek(yearWeek, 2)))
		
		return menus
	}
	
	void updateLunchOpenHours(Restaurant restaurant, String jsonMenu) {
		def weekMenu = new JsonSlurper().parseText(jsonMenu)
		
		weekMenu.each {
			if (it?.day == "monday") {
				restaurant.mondayLunchOpen = RestaurantUtils.createDate(it.openhoursfromhour, it.openhoursfromminute)
				restaurant.mondayLunchClosed = RestaurantUtils.createDate(it.openhourstohour, it.openhourstominute)
			}
			if (it?.day == "tuesday") {
				restaurant.tuesdayLunchOpen = RestaurantUtils.createDate(it.openhoursfromhour, it.openhoursfromminute)
				restaurant.tuesdayLunchClosed = RestaurantUtils.createDate(it.openhourstohour, it.openhourstominute)
			}
			if (it?.day == "wednesday") {
				restaurant.wednesdayLunchOpen = RestaurantUtils.createDate(it.openhoursfromhour, it.openhoursfromminute)
				restaurant.wednesdayLunchClosed = RestaurantUtils.createDate(it.openhourstohour, it.openhourstominute)
			}
			if (it?.day == "thursday") {
				restaurant.thursdayLunchOpen = RestaurantUtils.createDate(it.openhoursfromhour, it.openhoursfromminute)
				restaurant.thursdayLunchClosed = RestaurantUtils.createDate(it.openhourstohour, it.openhourstominute)
			}
			if (it?.day == "friday") {
				restaurant.fridayLunchOpen = RestaurantUtils.createDate(it.openhoursfromhour, it.openhoursfromminute)
				restaurant.fridayLunchClosed = RestaurantUtils.createDate(it.openhourstohour, it.openhourstominute)
			}
			if (it?.day == "saturday") {
				restaurant.saturdayLunchOpen = RestaurantUtils.createDate(it.openhoursfromhour, it.openhoursfromminute)
				restaurant.saturdayLunchClosed = RestaurantUtils.createDate(it.openhourstohour, it.openhourstominute)
			}
			if (it?.day == "sunday") {
				restaurant.sundayLunchOpen = RestaurantUtils.createDate(it.openhoursfromhour, it.openhoursfromminute)
				restaurant.sundayLunchClosed = RestaurantUtils.createDate(it.openhourstohour, it.openhourstominute)
			}
		}
	}
	
	void updateAutocomplete(Restaurant restaurant, String jsonMenu) {
		def weekMenu = new JsonSlurper().parseText(jsonMenu)
		weekMenu.each { day ->
			day?.items.each { item ->
				addAutocompleteItem(restaurant.originator, item?.name, item?.price)
			}
		}
	}
	
	void addAutocompleteItem(SecUser user, String name, String price) {
		if ( user!=null && StringUtils.isNotEmpty(name)) {
			if ( WeekMenuAutocomplete.findByUserAndName(user, name) == null ) {
				new WeekMenuAutocomplete(user: user, name: name, price: price).save()
			}
		}
	}
	
	List autocompleteSearch(String query, SecUser user) {
		def mealNames = WeekMenuAutocomplete.createCriteria().list {
			and {
				ilike("name", "%${query}%")
				eq("user", user)
			}
			order "name", "desc"
			maxResults 5
			projections {
				property "name"
			}
		}
		return mealNames
	}
}
