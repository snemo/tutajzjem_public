package pl.tutajzjem.restaurant.menu

import java.util.Date;

import org.apache.commons.collections.ListUtils;

import pl.tutajzjem.restaurant.Restaurant;
import pl.tutajzjem.security.SecUser;

class WeekMenu {

	String menu //menu for entire week - Monday to Sunday as JSON
	String openHours //hours when daily menu is sold
	Date firstDay //Monday is fist day of week
	Date lastDay //Sunday or Friday are last days of week
	Integer week //week no is taken from firstDay (Monday)
	Integer year
	
	SecUser originator
	Date dateCreated
	Date lastUpdated
	
	Restaurant restaurant
	List<Date> weekDays = ListUtils.EMPTY_LIST
	
	String getYearWeek() {
		return MenuUtils.createYearWeek(week, year)
	}
	
	void setYearWeek(String yearWeek) {
		year = MenuUtils.parseYear(yearWeek)
		week = MenuUtils.parseWeek(yearWeek)
		firstDay = MenuUtils.getFirstDayOfYearWeek(year, week)
		lastDay = MenuUtils.getLastDayOfYearWeek(year, week)
	}
	
	List<Date> getWeekDays() {
		if(weekDays.isEmpty()) {
			this.weekDays = MenuUtils.getWeekDays(yearWeek)
		}
		return weekDays
	}
	
    static constraints = {
		menu(nullable: true, blank:true)
		openHours(nullable: true, blank:true)
    }
	
	static mapping = {
		menu length: 32768 
	}
	
	static transients = ['yearWeek', 'weekDays']
	
	static WeekMenu findByRestaurantAndYearWeek(Restaurant restaurant, String yearWeek) {
		return WeekMenu.findByRestaurantAndYearAndWeek(restaurant, MenuUtils.parseYear(yearWeek), MenuUtils.parseWeek(yearWeek))
	}
}
