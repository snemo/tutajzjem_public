package pl.tutajzjem.security

import grails.plugin.springsecurity.authentication.dao.NullSaltSource;
import grails.plugin.springsecurity.ui.RegisterCommand;
import grails.plugin.springsecurity.ui.RegistrationCode;

class RegisterController extends grails.plugin.springsecurity.ui.RegisterController {
	
	def confirmation() {
	}
	
	def terms() {
	}
	
	def cookie() {
	}
	
	def register(RegisterCommand command) {
		
		if( ! simpleCaptchaService.validateCaptcha(params.captcha) ) {
			flash.error = message(code: 'spring.security.ui.forgotPassword.captcha')
			render view: 'index', model: [command: command]
			return
		}

		if (command.hasErrors()) {
			render view: 'index', model: [command: command]

			return
		}

		String salt = saltSource instanceof NullSaltSource ? null : command.username
		def user = lookupUserClass().newInstance(email: command.username,
												username: command.username,
												companyName: command.companyName,
												phone: command.phone,
												termsAccepted: command.termsAccepted,
												accountLocked: false,
												enabled: true)

		RegistrationCode registrationCode = springSecurityUiService.register(user, command.password, salt)
		if (registrationCode == null || registrationCode.hasErrors()) {
			// null means problem creating the user
			flash.error = message(code: 'spring.security.ui.register.miscError')
			flash.chainedParams = params
			redirect action: 'index'
			return
		}
		
		SecUserSecRole.create(user, SecRole.findByAuthority("ROLE_RESTAURATEUR"))
		springSecurityService.reauthenticate(user.username)

		String url = generateLink('verifyRegistration', [t: registrationCode.token])
		emailService.sendRegistrationConfirmation(user)
		
		flash.message = message(code: 'spring.security.ui.register.done')
		redirect controller:"manager", action: 'index', params: [registration:true]
	}
}
