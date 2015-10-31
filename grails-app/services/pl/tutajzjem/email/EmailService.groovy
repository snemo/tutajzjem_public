package pl.tutajzjem.email

import pl.tutajzjem.security.SecUser;
import grails.transaction.Transactional

@Transactional
class EmailService {
	
	def mailService

    def sendRegistrationConfirmation(SecUser user) {
		mailService.sendMail {
			async true
			to user.email
			subject "TutajZjem.pl Wita!"
			html( view:"/mail/registrationconfirmation",
				model:[user:user])
		}
	}
	
	def sendForgotPassword(SecUser user, String url) {
		mailService.sendMail {
			async true
			to "woj.olech@gmail.com"
			subject "Resetowanie hasła"
			html( view:"/mail/forgotpassword",
				model:[user:user, url:url])
		}
	}
	
}
