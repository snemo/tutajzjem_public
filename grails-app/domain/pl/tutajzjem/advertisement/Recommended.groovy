package pl.tutajzjem.advertisement

import groovy.transform.ToString;
import java.util.Date;

import org.grails.databinding.BindingFormat;

import pl.tutajzjem.restaurant.Restaurant;

@ToString(includeNames=true,includeFields=true)
class Recommended {
	
	public enum RecommendedType {
		BIG, SMALL
	}
	
	Restaurant restaurant
	RecommendedType recommendedType = RecommendedType.BIG
	boolean active = true
	
	@BindingFormat("dd.MM.yyyy")
	Date validFrom
	@BindingFormat("dd.MM.yyyy")
	Date validTo
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		validFrom(nullable: true, blank:true)
		validTo(nullable: true, blank:true)
    }
}

