package pl.tutajzjem.manager

import grails.plugin.springsecurity.SpringSecurityService;
import pl.tutajzjem.security.SecUser;

class UserController {
	
	SpringSecurityService springSecurityService

    def edit() {
		SecUser user = springSecurityService.getCurrentUser()
		[user:user]
	}
	
	def update(SecUser secUser) {
		SecUser currentUser = springSecurityService.getCurrentUser()
		if (secUser == null) {
			flash.error = message(code: 'manager.global.objectNotExists')
			redirect controller:"manager", action:"index"
			return
		}
		if (!(currentUser.hasRole("ROLE_ADMIN") || secUser.id==currentUser.id)) {
			flash.error = message(code: 'manager.global.notSufficientRights')
			redirect controller:"manager", action:"index"
			return
		}
		
		secUser.validate()

		if (secUser.hasErrors()) {
			render view:'edit', model:[user:secUser]
			return
		}
		
		secUser.save flush:true
		
		flash.message = message(code: 'manager.user.updated')
		redirect controller:"manager", action:"index"
	}
	
	def changePassword() {
		SecUser user = springSecurityService.getCurrentUser()
		[user:user]
	}
	
	def updatePassword(SecUser secUser, String oldPassword, String newPassword, String newPasswordRepeat) {
		SecUser currentUser = springSecurityService.getCurrentUser()
		if (secUser == null) {
			flash.error = message(code: 'manager.global.objectNotExists')
			redirect controller:"manager", action:"index"
			return
		}
		if (!(currentUser.hasRole("ROLE_ADMIN") || secUser.id==currentUser.id)) {
			flash.error = message(code: 'manager.global.notSufficientRights')
			redirect controller:"manager", action:"index"
			return
		}
		
		if(!springSecurityService.passwordEncoder.isPasswordValid(secUser.password, oldPassword, null)) {
			flash.error = message(code: 'manager.changePassword.oldPasswort.error')
			redirect controller:"user", action:"changePassword"
			return
		}
		
		if(newPassword != newPasswordRepeat) {
			flash.error = message(code: 'manager.changePassword.newPasswordRepeat.error')
			redirect controller:"user", action:"changePassword"
			return
		}
		
		secUser.password = newPassword
		if (secUser.hasPasswordErrors()) {
			flash.error = message(code: 'manager.global.password.error')
			redirect controller:"user", action:"changePassword"
			return
		}
		
		secUser.save flush:true
		flash.message = message(code: 'manager.changePassword.success')
		redirect controller:"manager", action:"index"
	}
}
