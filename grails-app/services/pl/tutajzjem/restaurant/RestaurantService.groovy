package pl.tutajzjem.restaurant

import pl.tutajzjem.security.SecUser;
import grails.transaction.Transactional

@Transactional
class RestaurantService {
	
	

    Restaurant setOpenHours(Restaurant restaurant, def params) {
		restaurant.mondayOpen = parseHourMinute(params.int('mondayFromHours'), params.int('mondayFromMinutes'))
		restaurant.mondayClosed = parseHourMinute(params.int('mondayToHours'), params.int('mondayToMinutes'))
		
		restaurant.tuesdayOpen = parseHourMinute(params.int('tuesdayFromHours'), params.int('tuesdayFromMinutes'))
		restaurant.tuesdayClosed = parseHourMinute(params.int('tuesdayToHours'), params.int('tuesdayToMinutes'))
		
		restaurant.wednesdayOpen = parseHourMinute(params.int('wednesdayFromHours'), params.int('wednesdayFromMinutes'))
		restaurant.wednesdayClosed = parseHourMinute(params.int('wednesdayToHours'), params.int('wednesdayToMinutes'))
		
		restaurant.thursdayOpen = parseHourMinute(params.int('thursdayFromHours'), params.int('thursdayFromMinutes'))
		restaurant.thursdayClosed = parseHourMinute(params.int('thursdayToHours'), params.int('thursdayToMinutes'))
		
		restaurant.fridayOpen = parseHourMinute(params.int('fridayFromHours'), params.int('fridayFromMinutes'))
		restaurant.fridayClosed = parseHourMinute(params.int('fridayToHours'), params.int('fridayToMinutes'))
		
		restaurant.saturdayOpen = parseHourMinute(params.int('saturdayFromHours'), params.int('saturdayFromMinutes'))
		restaurant.saturdayClosed = parseHourMinute(params.int('saturdayToHours'), params.int('saturdayToMinutes'))
		
		restaurant.sundayOpen = parseHourMinute(params.int('sundayFromHours'), params.int('sundayFromMinutes'))
		restaurant.sundayClosed = parseHourMinute(params.int('sundayToHours'), params.int('sundayToMinutes'))
		
		return restaurant
	}
	
	Date parseHourMinute(int hour, int minute) {
		Calendar cal = Calendar.getInstance()
		cal.set(Calendar.HOUR_OF_DAY, hour)
		cal.set(Calendar.MINUTE, minute)
		return cal.getTime()
	}
	
	Restaurant findByIdentifier(String identifier, SecUser user) {
		Restaurant restaurant = Restaurant.findByIdentifier(identifier)
		
		if( restaurant != null && restaurant.status != RestaurantStatus.ACTIVE) {
			if (user != null && (user.isAdmin() || restaurant.originator.equals(user))) {
				return restaurant
			} else {
				return null
			}
		} else {
			return restaurant
		}
	}
	
	Restaurant findByIdentifierForEdit(String identifier, SecUser user) {
		Restaurant restaurant = Restaurant.findByIdentifier(identifier)
		
		if (restaurant != null && user != null && (user.isAdmin() || restaurant.originator.equals(user))) {
			return restaurant
		}
		return null
	}
	
	boolean canEdit(Restaurant restaurant, SecUser user) {
		if(restaurant != null && user != null && (user.isAdmin() || restaurant.originator.equals(user))) {
			return true
		}
		return false
	}
}
