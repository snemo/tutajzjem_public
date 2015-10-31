package pl.tutajzjem.attachment

import grails.converters.JSON;

import org.codehaus.groovy.grails.web.mapping.LinkGenerator;
import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import pl.tutajzjem.restaurant.Restaurant;

class ImageController {

	static final IMAGE_CONTENTTYPE = "image/jpeg"
	
	ImageService imageService
	LinkGenerator grailsLinkGenerator
	
    def upload() { 
		log.debug("upload")
		def results = []
		
		if (request instanceof MultipartHttpServletRequest){
			
			for(filename in request.getFileNames()){
				MultipartFile file = request.getFile(filename)
				Image img = imageService.createImage(file)
				img.save(flush:true)
				
				results << [
					name: img.name,
					thumbnail_url: grailsLinkGenerator.link(controller: 'image', action: 'thumbnail', id: img.identifier, absolute: true),
					id: img.identifier
				]
			}
		}
		
		render results as JSON
	}
	
	def thumbnail(String id, String size) {
		Image img = Image.findByIdentifier(id)
		if(img == null)  {
			render "File not found"
			return
		}
		response.setContentType(IMAGE_CONTENTTYPE)
		if(size == "small") {
			response.setContentLength(img.smallThumbnail.size())
			response.outputStream << img.smallThumbnail
		} else if (size=="big") {
			response.setContentLength(img.bigThumbnail.size())
			response.outputStream << img.bigThumbnail
		} else {
			response.setContentLength(img.thumbnail.size())
			response.outputStream << img.thumbnail
		}
		response.outputStream.flush()
	}
	
	def circle() {
		Image img = Image.findByIdentifier(params.id)
		if(img == null)  {
			render "File not found"
			return
		}
		response.setContentType(IMAGE_CONTENTTYPE)
		response.setContentLength(img.circle.size())
		response.outputStream << img.circle
		response.outputStream.flush()
	}
	
	def get() {
		Image img = Image.findByIdentifier(params.id)
		if(img == null)  {
			render "File not found"
			return
		}
		response.setContentType(IMAGE_CONTENTTYPE)
		response.setContentLength(img.file.size())
		response.outputStream << img.file
		response.outputStream.flush()
	}
	
	def delete(String id) {
		log.debug("Deleting image: " + id)
		
		Image img = Image.findByIdentifier(id)
		if(img == null)  {
			render "File not found"
			return
		}
		
		Restaurant restaurant = Restaurant.findByImages(img)
		if(restaurant != null ) {
			restaurant.removeFromImages(img)
			restaurant.save(flush:true)
		}
		
		img.delete(flush:true);
		render "OK"
	}
	
}
