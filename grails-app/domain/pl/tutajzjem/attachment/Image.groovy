package pl.tutajzjem.attachment

import java.util.Date;
import java.lang.Comparable

import groovy.transform.ToString;

import org.springframework.web.multipart.MultipartFile;

import pl.tutajzjem.restaurant.Restaurant;

@ToString(includeNames=true,includeFields=true,excludes="file,thumbnail,smallThumbnail,bigThumbnail,circle")
class Image implements Comparable {

	byte[] file
	byte[] thumbnail
	byte[] smallThumbnail
	byte[] bigThumbnail
	byte[] circle
	String name
	String extension
	String contentType
	String identifier
	
	Date dateCreated
	Date lastUpdated
	
	//static belongsTo = [restaurant: Restaurant]
	
	static mapping = {
		id generator: 'assigned', name: "identifier", type: 'string'
	}
	
    static constraints = {
		//Max file size 10MB
		file maxSize: 1024 * 1024 * 10
		thumbnail maxSize: 1024 * 1024 * 10
		smallThumbnail maxSize: 1024 * 1024 * 10
		bigThumbnail maxSize: 1024 * 1024 * 10
		circle maxSize: 1024 * 1024 * 10
    }
	
	public int compareTo(def obj) {
		int cd = dateCreated.compareTo(obj?.dateCreated)
		return cd == 0 ? name.compareTo(obj.name) : cd
	}
}
