package pl.tutajzjem.home

import java.util.List;

import pl.tutajzjem.restaurant.Cuisine;
import pl.tutajzjem.restaurant.Restaurant;
import pl.tutajzjem.restaurant.RestaurantService;
import pl.tutajzjem.restaurant.RestaurantStatus;
import pl.tutajzjem.restaurant.RestaurantType;
import pl.tutajzjem.restaurant.menu.WeekMenu;
import pl.tutajzjem.search.SearchTZService;
import pl.tutajzjem.security.Region;
import pl.tutajzjem.security.SecUser;
import grails.plugin.springsecurity.SpringSecurityService;
import grails.test.mixin.*
import spock.lang.*


@TestFor(HomeController)
@Mock([Restaurant, SpringSecurityService, RestaurantService, RestaurantType, Cuisine])
class HomeControllerSpec extends Specification {

	def setup() {
		def weekMenu = mockFor(WeekMenu).createMock()
		weekMenu.menu = '[{"day":"monday","label":"Poniedziałek 06.10","date":"06.10.2014","openhoursfromhour":"11","openhoursfromminute":"30","openhourstohour":"17","openhourstominute":"45","items":[{"name":"DANIE DIETETYCZNE: GULASZ Z CUKINII Z KURCZAKIEM I CIEMNYM PIECZYWEM","position":"0","price":"12"},{"name":"ROLADA DROBIOWA FASZEROWANA SMAŻONA, ZIEMNIAKI, SUR&amp;amp;Oacute;WKA","position":"0","price":"12"}]},{"day":"tuesday","label":"Wtorek 30.09","date":"07.10.2014","openhoursfromhour":"7","openhoursfromminute":"45","openhourstohour":"14","openhourstominute":"00","items":[{"name":"KOTLET SCHABOWY, ZIEMNIAKI, KAPUSTA ZASMAŻANA/SUR&amp;amp;Oacute;WKA ","position":"0","price":""},{"name":"DANIE DIETETYCZNE: PIECZEŃ Z INDYKA, SAŁATKA DANIE DIETETYCZNE: PIECZEŃ Z INDYKA, SAŁATKA DANIE DIETETYCZNE: PIECZEŃ Z INDYKA, SAŁATKA","position":"0","price":"11"}]},{"day":"wednesday","label":"Środa 01.10","date":"08.10.2014","openhoursfromhour":"10","openhoursfromminute":"00","openhourstohour":"12","openhourstominute":"45","items":[{"name":"DANIE DIETETYCZNE: UDKO GOTOWANE, SAŁATKA","position":"0","price":""},{"name":"DANIE DIETETYCZNE: UDKO GOTOWANE, SAŁATKA","position":"0","price":"212"},{"name":"DANIE DIETETYCZNE: UDKO GOTOWANE, SAŁATKA","position":"0","price":"12"},{"name":"DANIE DIETETYCZNE: UDKO GOTOWANE, SAŁATKA","position":"0","price":"12"}]},{"day":"thursday","label":"Czwartek 02.10","date":"09.10.2014","openhoursfromhour":"1","openhoursfromminute":"00","openhourstohour":"1","openhourstominute":"00","items":[{"name":"DORSZ SMAŻONY LUB ZAPIEKANY W SOSIE MUSZTARDOWYM ,ZIEMNIAKI, SUR&amp;amp;Oacute;WKA","position":"0","price":""},{"name":"DORSZ SMAŻONY LUB ZAPIEKANY W SOSIE MUSZTARDOWYM ,ZIEMNIAKI, SUR&amp;amp;Oacute;WKA","position":"0","price":"12"}]},{"day":"friday","label":"Piątek 03.10","date":"10.10.2014","openhoursfromhour":"10","openhoursfromminute":"45","openhourstohour":"14","openhourstominute":"00","items":[{"name":"ZUPA ZIEMNIACZANA Z KURKAMI","position":"0","price":"12"},{"name":"PIECZEŃ ZE SCHABU Z PIECZARKAMI I SEREM W SOSIE, ZIEMNIAKI/KASZA, SUR&amp;amp;Oacute;WKA","position":"0","price":"12"}]},{"day":"saturday","label":"Sobota 11.10","date":"04.10.2014","openhoursfromhour":"5","openhoursfromminute":"45","openhourstohour":"4","openhourstominute":"45","items":[{"name":"WARKOCZ DROBIOWY Z SEREM W CIEŚCIE FRANCUSKIM, SAŁATKA, KOMPOT","position":"0","price":"12"},{"name":"WARKOCZ DROBIOWY Z SEREM W CIEŚCIE FRANCUSKIM, SAŁATKA, KOMPOT","position":"0","price":"12"}]},{"day":"sunday","label":"Niedziela 28.09","date":"05.10.2014","openhoursfromhour":"10","openhoursfromminute":"45","openhourstohour":"12","openhourstominute":"30","items":[{"name":"PULPETY DROBIOWE W SOSIE KOPERKOWYM, RYŻ/ZIEMNIAKI, SUR&amp;amp;Oacute;WKA","position":"0","price":"1212"},{"name":"PULPETY DROBIOWE W SOSIE KOPERKOWYM, RYŻ/ZIEMNIAKI, SUR&amp;amp;Oacute;WKA","position":"0","price":"12"}]}]'
		def mockedRestaurant = mockFor(Restaurant)
		mockedRestaurant.demand.getCurrentWeekMenu {->weekMenu}
		def restaurant = mockedRestaurant.createMock()
		
		def mockedRestaurantServ = mockFor(RestaurantService);
		mockedRestaurantServ.demand.findByIdentifier {String identifier, SecUser user -> restaurant}
		
		controller.restaurantService = mockedRestaurantServ.createMock()
		
		def mockedSearch = mockFor(SearchTZService)
		mockedSearch.demand.search {String query, String category, List<String> restaurantType, List<String> cuisine, long offset, int max -> [restaurant]}
		
		controller.searchTZService = mockedSearch.createMock()
	}

	def cleanup() {
	}

	void "Open restaurant page"() {
		when:"Open restaurant"
			controller.restaurant("test-id")

		then:"The correct resturant was returned"
			model != null

	}
	
	void "Search for restaurant"() {
		when:"Search for restaurant"
			controller.search("test-id", "")

		then:"One restaturand should found"
			model.size() == 1

	}
}
