package pl.tutajzjem.attachment

import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;

import grails.transaction.Transactional

import org.apache.commons.io.FilenameUtils;
import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile

@Transactional
class ImageService {
	
	static final int IMAGE_MAXSIZE = 1024
	
	static final int THUMBNAIL_WIDTH = 200
	static final int THUMBNAIL_HEIGHT = 150
	
	static final int SMALL_THUMBNAIL_WIDTH = 102
	static final int SMALL_THUMBNAIL_HEIGHT = 76
	
	static final int BIG_THUMBNAIL_WIDTH = 450
	static final int BIG_THUMBNAIL_HEIGHT = 325
	
	static final int CIRCLE_MINSIZE = 200
	
	byte[] resizeImage(MultipartFile file, int maxSize) {
		BufferedImage inBF = ImageIO.read(file.getInputStream())
		BufferedImage outBF = Scalr.resize(inBF, maxSize)
		ByteArrayOutputStream baos = new ByteArrayOutputStream()
		ImageIO.write(outBF, "jpg", baos)
		baos.flush()
		return baos.toByteArray()
	}
	
	byte[] createThumbnail(MultipartFile file, int maxWidth, int maxHeight) {
		BufferedImage inBF = ImageIO.read(file.getInputStream())
		BufferedImage outBF = null
		int height = inBF.getHeight()
		int width = inBF.getWidth()
		
		double factor = width / maxWidth
		
		if (height/factor <= maxHeight) {
			outBF = Scalr.resize(inBF, Scalr.Mode.FIT_TO_WIDTH, maxWidth)
		} else {
			outBF = Scalr.resize(inBF, Scalr.Mode.FIT_TO_HEIGHT, maxHeight)
		}
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream()
		ImageIO.write(outBF, "jpg", baos)
		baos.flush()
		return baos.toByteArray()
	}
	
	byte[] createCircle(MultipartFile file) {
		BufferedImage inBF = ImageIO.read(file.getInputStream())
		BufferedImage outBF = null
		int height = inBF.getHeight()
		int width = inBF.getWidth()
		
		if(height < width) {
			outBF = Scalr.resize(inBF, Scalr.Mode.FIT_TO_HEIGHT, CIRCLE_MINSIZE)
		} else {
			outBF = Scalr.resize(inBF, Scalr.Mode.FIT_TO_WIDTH, CIRCLE_MINSIZE)
		}
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream()
		ImageIO.write(outBF, "jpg", baos)
		baos.flush()
		return baos.toByteArray()
	}
	
	byte[] createThumbnailWithCrop(MultipartFile file, int width, int height) {
		BufferedImage inBF = ImageIO.read(file.getInputStream())
		BufferedImage outBF = null
		int imgHeight = inBF.getHeight()
		int imgWidth = inBF.getWidth()
		double factor = imgWidth / width
		
		if (imgHeight/factor <= height) {
			outBF = Scalr.resize(inBF, Scalr.Mode.FIT_TO_HEIGHT, height)
			Float cut = (outBF.getWidth() - width)/2
			outBF = Scalr.crop(outBF, cut.intValue(), 0, width, height)
			
		} else {
			outBF = Scalr.resize(inBF, Scalr.Mode.FIT_TO_WIDTH, width)
			Float cut = (outBF.getHeight() - height)/2
			outBF = Scalr.crop(outBF, 0, cut.intValue(), width, height)
		}
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream()
		ImageIO.write(outBF, "jpg", baos)
		baos.flush()
		return baos.toByteArray() 
	}
	
	Image createImage(MultipartFile file) {
		file.getOriginalFilename()
		return new Image(	file: resizeImage(file, IMAGE_MAXSIZE),
							thumbnail: createThumbnailWithCrop(file, THUMBNAIL_WIDTH, THUMBNAIL_HEIGHT),
							smallThumbnail: createThumbnailWithCrop(file, SMALL_THUMBNAIL_WIDTH, SMALL_THUMBNAIL_HEIGHT),
							bigThumbnail: createThumbnailWithCrop(file, BIG_THUMBNAIL_WIDTH, BIG_THUMBNAIL_HEIGHT),
							circle: createCircle(file),
							name: file.getOriginalFilename(),
							contentType: file.getContentType(), 
							extension: FilenameUtils.getExtension(file.getOriginalFilename()),
							identifier: UUID.randomUUID().toString() )
	}
}

