import grails.util.Environment;

import java.sql.Date;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.time.DateUtils;

import pl.tutajzjem.advertisement.Recommended;
import pl.tutajzjem.attachment.Image;
import pl.tutajzjem.attachment.ImageService;
import pl.tutajzjem.restaurant.Cuisine
import pl.tutajzjem.restaurant.Restaurant
import pl.tutajzjem.restaurant.RestaurantStatus;
import pl.tutajzjem.restaurant.RestaurantType
import pl.tutajzjem.restaurant.menu.MenuUtils;
import pl.tutajzjem.restaurant.menu.PermanentMenu
import pl.tutajzjem.restaurant.menu.PermanentMenuCategory
import pl.tutajzjem.restaurant.menu.PermanentMenuItem
import pl.tutajzjem.restaurant.menu.WeekMenu;
import pl.tutajzjem.restaurant.menu.WeekMenuAutocomplete;
import pl.tutajzjem.security.Region
import pl.tutajzjem.security.SecRole
import pl.tutajzjem.security.SecUser
import pl.tutajzjem.security.SecUserSecRole
import pl.tutajzjem.utils.DevelopmentUtils;

class BootStrap {
	
	def grailsApplication
	ImageService imageService
	DevelopmentUtils developmentUtils

    def init = { servletContext ->
		/***************************************
		 * USER MANAGEMENT
		 ***************************************/
		
		if(SecUser.findByUsername("admin@admin.pl")!=null) {
			return
		} 
		
		//Create admin user
		def adminRole = new SecRole(authority: 'ROLE_ADMIN').save(flush: true)
		def restaurateurRole = new SecRole(authority: 'ROLE_RESTAURATEUR').save(flush: true)
		def adminUser = new SecUser(username: 'admin@admin.pl', password: 'testtest', companyName:"Nux Planet", email:"some@email.com", phone:"3943984398").save(flush: true)
		def restaurateurUser = new SecUser(username: 'restaurateur@tutajzjem.pl', password: 'testtest', companyName:"Nux Planet", email:"some3@email.com", phone:"3943984398").save(flush: true)
		SecUserSecRole.create adminUser, adminRole, true
		SecUserSecRole.create restaurateurUser, restaurateurRole, true
		
		/***************************************
		 * RESTAURANT TYPES
		 ***************************************/
		def type_restaurant = new RestaurantType(name:"RESTAURANT", defaultTransaltion:"restauracja", priority:100); type_restaurant.save(flush:true)
		def type_pizzeria = new RestaurantType(name:"PIZZERIA", defaultTransaltion:"pizzeria", priority:90); type_pizzeria.save(flush:true)
		def type_cafe = new RestaurantType(name:"CAFE", defaultTransaltion:"kawiarnia", priority:80); type_cafe.save(flush:true)
		def type_bar = new RestaurantType(name:"BAR", defaultTransaltion:"bar", priority:70); type_bar.save(flush:true)
		def type_fastfood = new RestaurantType(name:"FASTFOOD", defaultTransaltion:"fast food", priority:60); type_fastfood.save(flush:true)
		def type_canteen = new RestaurantType(name:"CANTEEN", defaultTransaltion:"stołówka", priority:50); type_canteen.save(flush:true)
		
		/***************************************
		 * CUISINE
		 ***************************************/
		def cuisine_polish = new Cuisine(name:"POLISH", defaultTransaltion:"polska", priority:100); cuisine_polish.save(flush:true)
		def cuisine_italian = new Cuisine(name:"ITALIAN", defaultTransaltion:"włoska", priority:90); cuisine_italian.save(flush:true)
		def cuisine_chinese = new Cuisine(name:"CHINESE", defaultTransaltion:"chińska", priority:80); cuisine_chinese.save(flush:true)
		def cuisine_oldpolish = new Cuisine(name:"OLD_POLISH", defaultTransaltion:"staropolska", priority:70); cuisine_oldpolish.save(flush:true)
		def cuisine_vegetarian = new Cuisine(name:"VEGETARIAN", defaultTransaltion:"wegetariańska", priority:60); cuisine_vegetarian.save(flush:true)
		def cuisine_mexican = new Cuisine(name:"MEXICAN", defaultTransaltion:"meksykańska", priority:50); cuisine_mexican.save(flush:true)
		def cuisine_indian = new Cuisine(name:"INDIAN", defaultTransaltion:"indyjska", priority:40); cuisine_indian.save(flush:true)
		def cuisine_international = new Cuisine(name:"INTERNATIONAL", defaultTransaltion:"międzynarodowa", priority:30); cuisine_international.save(flush:true)
		
		
		
		
		/***************************************
		 * DUMMY TEST DATA
		 ***************************************/
		if (Environment.current == Environment.DEVELOPMENT) {
			developmentUtils.prepareDummyData()
		}
		
		
    }
    def destroy = {
    }
}
