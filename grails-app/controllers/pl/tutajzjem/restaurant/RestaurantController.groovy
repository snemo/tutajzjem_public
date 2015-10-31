package pl.tutajzjem.restaurant



import static org.springframework.http.HttpStatus.*

import org.hibernate.FlushMode;

import grails.plugin.springsecurity.SpringSecurityService;
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RestaurantController {

	SpringSecurityService springSecurityService
	RestaurantService restaurantService
	
    //static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Restaurant.list(params), model:[restaurantInstanceCount: Restaurant.count()]
    }

    def show(Restaurant restaurantInstance) {
        respond restaurantInstance
    }

    def create() {
        respond new Restaurant(params)
    }

    @Transactional
    def save(Restaurant restaurantInstance) {
        if (restaurantInstance == null) {
            notFound()
            return
        }
		
		restaurantInstance.originator = springSecurityService.getCurrentUser()
		restaurantInstance = restaurantService.setOpenHours(restaurantInstance, params)
		
		
		restaurantInstance.validate()
        if (restaurantInstance.hasErrors()) {
            respond restaurantInstance.errors, view:'create'
            return
        }
		

        restaurantInstance.save flush:true
		
		flash.message = message(code: 'restaurant.created.message', args: [restaurantInstance.name])
		redirect controller:"manager", action:"index"
    }

    def edit(String id) {
		Restaurant restaurant = restaurantService.findByIdentifierForEdit(id, springSecurityService.getCurrentUser())
        respond restaurant, model:[user:springSecurityService.getCurrentUser()] 
    }

    @Transactional
    def update(Restaurant restaurantInstance) {
        if (restaurantInstance == null || !restaurantService.canEdit(restaurantInstance, springSecurityService.getCurrentUser())) {
            restaurantInstance.discard()
			notFound()
            return
        }
		
		restaurantInstance = restaurantService.setOpenHours(restaurantInstance, params)
		restaurantInstance.validate()

        if (restaurantInstance.hasErrors()) {
            render view:'edit', model:[restaurantInstance:restaurantInstance]
            return
        }
		
		restaurantInstance.save flush:true

        flash.message = message(code: 'restaurant.updated.message', args: [restaurantInstance.name])
		if(springSecurityService.getCurrentUser().isAdmin()) {
			redirect controller:"admin", action:"index"
		} else {
			redirect controller:"manager", action:"index"
		}
		
    }

    @Transactional
    def delete(Restaurant restaurantInstance) {
		if(!springSecurityService.getCurrentUser()?.isAdmin()) {
			notFound()
			return
		}
		
        if (restaurantInstance == null) {
            notFound()
            return
        }

        restaurantInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Restaurant.label', default: 'Restaurant'), restaurantInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'restaurantInstance.label', default: 'Restaurant'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
