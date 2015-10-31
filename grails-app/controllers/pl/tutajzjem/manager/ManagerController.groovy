package pl.tutajzjem.manager

import grails.plugin.springsecurity.SpringSecurityService;
import pl.tutajzjem.email.EmailService;
import pl.tutajzjem.restaurant.Restaurant;
import pl.tutajzjem.security.SecUser;

class ManagerController {

	SpringSecurityService springSecurityService
	EmailService emailService
	
    def index() { 
		SecUser user = springSecurityService.getCurrentUser()
		respond Restaurant.findAllByOriginator(user, [sort: "name", order: "asc"]), model:[restaurantInstanceCount: Restaurant.countByOriginator(user), user:user]
	}
	
	def promotion() {
		
	}
	
	
}
