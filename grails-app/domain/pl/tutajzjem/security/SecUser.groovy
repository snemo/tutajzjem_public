package pl.tutajzjem.security

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

class SecUser {

	transient springSecurityService

	String username
	String password
	String email
	String companyName
	String phone
	String streetNo
	String city
	String postcode
	String nip
	String regon
	
	String securityPin = "0000"
	boolean termsAccepted = false
	boolean verified = false // true if account was verified
	
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static transients = ['springSecurityService', 'admin']

	static constraints = {
		username blank: false, unique: true, email: true
		password blank: false
		streetNo(nullable: true, blank:true)
		city(nullable: true, blank:true)
		postcode(nullable: true, blank:true)
		nip(nullable: true, blank:true)
		regon(nullable: true, blank:true)
	}

	static mapping = {
		password column: '`password`'
	}

	Set<SecRole> getAuthorities() {
		SecUserSecRole.findAllBySecUser(this).collect { it.secRole }
	}
	
	boolean hasRole(String role) {
		return this.authorities.any { it.authority == role }
	}
	
	boolean hasPasswordErrors() {
		if(password?.size() < 6) {
			return true
		}
	}
	
	boolean isAdmin() {
		return hasRole("ROLE_ADMIN")
	}

	def beforeInsert() {
		encodePassword()
		generatePin()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
	
	protected void generatePin() {
		securityPin = ""+((int)(Math.random()*9000)+1000)
	}
	
	@Override
	public boolean equals(Object obj) {
		return EqualsBuilder.reflectionEquals(this, obj, ['username'])
	}
	
	@Override
	public int hashCode() {
		return HashCodeBuilder.reflectionHashCode(this, ['username'])
	}
	
	@Override
	public String toString() {
		return username
	}
}
