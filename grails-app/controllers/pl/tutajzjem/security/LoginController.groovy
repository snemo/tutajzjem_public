package pl.tutajzjem.security

class LoginController extends grails.plugin.springsecurity.LoginController {
	
	@Override
	def denied() {
		println "here!! denied"
		
		flash.message = message(code: 'springSecurity.errors.login.disabled')
		
		redirect controller:"login", action: 'auth', params: [registration:true]
	}
	
}
