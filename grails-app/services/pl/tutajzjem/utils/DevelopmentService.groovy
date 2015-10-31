package pl.tutajzjem.utils

import grails.transaction.Transactional

import java.sql.Date;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.time.DateUtils;

import pl.tutajzjem.advertisement.Recommended;
import pl.tutajzjem.attachment.Image;
import pl.tutajzjem.attachment.ImageService;
import pl.tutajzjem.restaurant.Cuisine
import pl.tutajzjem.restaurant.Restaurant
import pl.tutajzjem.restaurant.RestaurantStatus;
import pl.tutajzjem.restaurant.RestaurantType
import pl.tutajzjem.restaurant.menu.MenuUtils;
import pl.tutajzjem.restaurant.menu.PermanentMenu
import pl.tutajzjem.restaurant.menu.PermanentMenuCategory
import pl.tutajzjem.restaurant.menu.PermanentMenuItem
import pl.tutajzjem.restaurant.menu.WeekMenu;
import pl.tutajzjem.restaurant.menu.WeekMenuAutocomplete;
import pl.tutajzjem.security.Region
import pl.tutajzjem.security.SecRole
import pl.tutajzjem.security.SecUser
import pl.tutajzjem.security.SecUserSecRole

@Transactional
class DevelopmentService {
	
	ImageService imageService

    def prepareDummyData() {
		
		String pernamentMenuJSON = '[{"position":0,"name":"ŚNIADANIA","items":[{"name":"JAJECZNICA NA MAŚLE Z TRZECH JAJEK","position":0,"price":"9,00","description":"z dodatkami do wyboru: boczek, szynka, pieczarki, pomidor"},{"name":"OMLET Z SZYNK Ą I PIECZARKAMI.","position":1,"price":"12","description":""},{"name":"FRANKFUTERKI Z RUSZTU.","position":2,"price":"23,00","description":""}]},{"position":1,"name":"DANIA WEGETARIAŃSKIE","items":[{"name":" SER PANIEROWANY Z SOSEM CZOSNKOWYM 130g","position":0,"price":"18,50","description":"frytki, zestaw sur&oacute;wek"},{"name":"PLACEK ZIEMNIACZANY Z PIECZARKAMI DUSZONYMI W ŚMIETANIE 170/250g","position":1,"price":"17","description":""},{"name":"","position":2,"price":"","description":""},{"name":"","position":3,"price":"","description":""},{"name":"","position":4,"price":"","description":""},{"name":"","position":5,"price":"","description":""}]},{"position":2,"name":"KUCHNIA TRADYCYJNA","items":[{"name":"PLACEK PO WĘGIERSKU 220/320g","position":0,"price":"14,00/19,50","description":""},{"name":"KOTLET SCHABOWY 140g","position":1,"price":"19,50","description":"ziemniaki gotowane, mizeria"},{"name":"KOTLET Z KURCZAKA 130g","position":2,"price":"19,50","description":"ziemniaki gotowane, zestaw surówek"},{"name":"ESKALOPKI Z KURCZAKA 80/130g","position":3,"price":"13,00/18,50","description":"frytki, zestaw surówek"},{"name":"WĄTRÓBKA Z CEBULKĄ 140g","position":4,"price":"22,00","description":"ziemniaki gotowane, zestaw surówek"},{"name":"","position":5,"price":"","description":""},{"name":"","position":6,"price":"","description":""},{"name":"","position":7,"price":"","description":""},{"name":"","position":8,"price":"","description":""}]},{"position":3,"name":"DANIA ZE SCHABU","items":[{"name":"SCHAB PO STAROPOLSKU W SOSIE  BOROWIKOWO-PODGRZYBKOWYM 140g","position":0,"price":"27,00","description":"ziemniaki gotowane, zestaw surówek"},{"name":"SCHAB FASZEROWANY SEREM PLEŚNIOWYM 190g","position":1,"price":"25,00","description":"frytki, zestaw surówek"},{"name":"SCHAB ZAWIJANY Z SEREM, SZYNKĄ I PIECZARKAMI  190g","position":2,"price":"25,00","description":"talarki ziemniaczane , zestaw surówek"},{"name":"SCHAB PO CYGAŃSKU Z BOCZKIEM na ostro140g","position":3,"price":"24,00","description":"ziemniaki opiekane, kapusta zasmażana"},{"name":"SCHAB Z GRILLA W ZIOŁACH 130g","position":4,"price":"21,00","description":"frytki, zestaw surówek"}]},{"position":4,"name":"DODATKI","items":[{"name":"FRYTKI 170g","position":0,"price":"6,00","description":""},{"name":"ZIEMNIAKI OPIEKANE160g","position":1,"price":"6,00","description":""},{"name":"SZPINAK Z PARMEZANEM 160g","position":2,"price":"8,00","description":""},{"name":"POMIDORY Z PARMEZANEM140g","position":3,"price":"7,00","description":""},{"name":"WARZYWA GOTOWANE 180g","position":4,"price":"8,00","description":""}]}]'
		String weekMenuJSON = '[{"day":"monday","label":"Poniedziałek 06.10","date":"06.10.2014","openhoursfromhour":"11","openhoursfromminute":"30","openhourstohour":"17","openhourstominute":"45","items":[{"name":"DANIE DIETETYCZNE: GULASZ Z CUKINII Z KURCZAKIEM I CIEMNYM PIECZYWEM","position":"0","price":"12"},{"name":"ROLADA DROBIOWA FASZEROWANA SMAŻONA, ZIEMNIAKI, SUR&amp;amp;Oacute;WKA","position":"0","price":"12"}]},{"day":"tuesday","label":"Wtorek 30.09","date":"07.10.2014","openhoursfromhour":"7","openhoursfromminute":"45","openhourstohour":"14","openhourstominute":"00","items":[{"name":"KOTLET SCHABOWY, ZIEMNIAKI, KAPUSTA ZASMAŻANA/SUR&amp;amp;Oacute;WKA ","position":"0","price":""},{"name":"DANIE DIETETYCZNE: PIECZEŃ Z INDYKA, SAŁATKA DANIE DIETETYCZNE: PIECZEŃ Z INDYKA, SAŁATKA DANIE DIETETYCZNE: PIECZEŃ Z INDYKA, SAŁATKA","position":"0","price":"11"}]},{"day":"wednesday","label":"Środa 01.10","date":"08.10.2014","openhoursfromhour":"10","openhoursfromminute":"00","openhourstohour":"12","openhourstominute":"45","items":[{"name":"DANIE DIETETYCZNE: UDKO GOTOWANE, SAŁATKA","position":"0","price":""},{"name":"DANIE DIETETYCZNE: UDKO GOTOWANE, SAŁATKA","position":"0","price":"212"},{"name":"DANIE DIETETYCZNE: UDKO GOTOWANE, SAŁATKA","position":"0","price":"12"},{"name":"DANIE DIETETYCZNE: UDKO GOTOWANE, SAŁATKA","position":"0","price":"12"}]},{"day":"thursday","label":"Czwartek 02.10","date":"09.10.2014","openhoursfromhour":"1","openhoursfromminute":"00","openhourstohour":"1","openhourstominute":"00","items":[{"name":"DORSZ SMAŻONY LUB ZAPIEKANY W SOSIE MUSZTARDOWYM ,ZIEMNIAKI, SUR&amp;amp;Oacute;WKA","position":"0","price":""},{"name":"DORSZ SMAŻONY LUB ZAPIEKANY W SOSIE MUSZTARDOWYM ,ZIEMNIAKI, SUR&amp;amp;Oacute;WKA","position":"0","price":"12"}]},{"day":"friday","label":"Piątek 03.10","date":"10.10.2014","openhoursfromhour":"10","openhoursfromminute":"45","openhourstohour":"14","openhourstominute":"00","items":[{"name":"ZUPA ZIEMNIACZANA Z KURKAMI","position":"0","price":"12"},{"name":"PIECZEŃ ZE SCHABU Z PIECZARKAMI I SEREM W SOSIE, ZIEMNIAKI/KASZA, SUR&amp;amp;Oacute;WKA","position":"0","price":"12"}]},{"day":"saturday","label":"Sobota 11.10","date":"04.10.2014","openhoursfromhour":"5","openhoursfromminute":"45","openhourstohour":"4","openhourstominute":"45","items":[{"name":"WARKOCZ DROBIOWY Z SEREM W CIEŚCIE FRANCUSKIM, SAŁATKA, KOMPOT","position":"0","price":"12"},{"name":"WARKOCZ DROBIOWY Z SEREM W CIEŚCIE FRANCUSKIM, SAŁATKA, KOMPOT","position":"0","price":"12"}]},{"day":"sunday","label":"Niedziela 28.09","date":"05.10.2014","openhoursfromhour":"10","openhoursfromminute":"45","openhourstohour":"12","openhourstominute":"30","items":[{"name":"PULPETY DROBIOWE W SOSIE KOPERKOWYM, RYŻ/ZIEMNIAKI, SUR&amp;amp;Oacute;WKA","position":"0","price":"1212"},{"name":"PULPETY DROBIOWE W SOSIE KOPERKOWYM, RYŻ/ZIEMNIAKI, SUR&amp;amp;Oacute;WKA","position":"0","price":"12"}]}]'
		
		def image1 = new Image(	file: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-file1.bin").getInputStream()),
			thumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-thumbnail1.bin").getInputStream()),
			smallThumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-small_thumbnail1.bin").getInputStream()),
			bigThumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-big_thumbnail1.bin").getInputStream()),
			circle: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-circle1.bin").getInputStream()),
			name: "name1",
			contentType: "con",
			extension: "jpeg",
			identifier: UUID.randomUUID().toString() )
		image1.save(flush:true)
		
		def image2 = new Image(	file: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-file2.bin").getInputStream()),
				thumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-thumbnail2.bin").getInputStream()),
				smallThumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-small_thumbnail2.bin").getInputStream()),
				bigThumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-big_thumbnail2.bin").getInputStream()),
				circle: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-circle2.bin").getInputStream()),
				name: "name2",
				contentType: "con",
				extension: "jpeg",
				identifier: UUID.randomUUID().toString() )
		image2.save(flush:true)
		
		def image3 = new Image(	file: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-file3.bin").getInputStream()),
				thumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-thumbnail3.bin").getInputStream()),
				smallThumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-small_thumbnail3.bin").getInputStream()),
				bigThumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-big_thumbnail3.bin").getInputStream()),
				circle: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-circle3.bin").getInputStream()),
				name: "name3",
				contentType: "con",
				extension: "jpeg",
				identifier: UUID.randomUUID().toString() )
		image3.save(flush:true)
		
		def image4 = new Image(	file: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-file4.bin").getInputStream()),
				thumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-thumbnail4.bin").getInputStream()),
				smallThumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-small_thumbnail4.bin").getInputStream()),
				bigThumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-big_thumbnail4.bin").getInputStream()),
				circle: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-circle4.bin").getInputStream()),
				name: "name4",
				contentType: "con",
				extension: "jpeg",
				identifier: UUID.randomUUID().toString() )
		image4.save(flush:true)
		
		def image5 = new Image(	file: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-file5.bin").getInputStream()),
				thumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-thumbnail5.bin").getInputStream()),
				smallThumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-small_thumbnail5.bin").getInputStream()),
				bigThumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-big_thumbnail5.bin").getInputStream()),
				circle: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-circle5.bin").getInputStream()),
				name: "name5",
				contentType: "con",
				extension: "jpeg",
				identifier: UUID.randomUUID().toString() )
		image5.save(flush:true)
		
		def image6 = new Image(	file: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-file6.bin").getInputStream()),
				thumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-thumbnail6.bin").getInputStream()),
				smallThumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-small_thumbnail6.bin").getInputStream()),
				bigThumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-big_thumbnail6.bin").getInputStream()),
				circle: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-circle6.bin").getInputStream()),
				name: "name6",
				contentType: "con",
				extension: "jpeg",
				identifier: UUID.randomUUID().toString() )
		image6.save(flush:true)
		
		def image7 = new Image(	file: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-file4.bin").getInputStream()),
			thumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-thumbnail4.bin").getInputStream()),
			smallThumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-small_thumbnail4.bin").getInputStream()),
			bigThumbnail: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-big_thumbnail4.bin").getInputStream()),
			circle: IOUtils.toByteArray(grailsApplication.getParentContext().getResource("classpath:resources/image-circle4.bin").getInputStream()),
			name: "name7",
			contentType: "con",
			extension: "jpeg",
			identifier: UUID.randomUUID().toString() )
		image7.save(flush:true)
		
		Restaurant restaurant = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Restauracja Zak", originator: adminUser, postcode: "43-400", streetno: "Rynek 10", region: Region.DOLNOSLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant.addToTypes(type_restaurant)
		restaurant.addToTypes(type_pizzeria)
		restaurant.addToCuisines(cuisine_polish)
		restaurant.addToCuisines(cuisine_international)
		
		
		def permanentMenuItem1 = new PermanentMenuItem(name: "Schabowy", position: 0, price: "10"); permanentMenuItem1.save(flush:true)
		def permanentMenuItem2 = new PermanentMenuItem(name: "Mielony", position: 1, price: "10"); permanentMenuItem2.save(flush:true)
		def permanentMenuItem3 = new PermanentMenuItem(name: "Dorsz", position: 0, price: "10"); permanentMenuItem3.save(flush:true)
		def permanentMenuItem4 = new PermanentMenuItem(name: "Losos", position: 1, price: "10"); permanentMenuItem4.save(flush:true)
		
		def permanentMenuCategory1 = new PermanentMenuCategory(name: "Dania miesne", position: 0);
		permanentMenuCategory1.addToItems(permanentMenuItem1)
		permanentMenuCategory1.addToItems(permanentMenuItem2)
		permanentMenuCategory1.save(flush:true)
		
		def permanentMenuCategory2 = new PermanentMenuCategory(name: "Dania rybne", position: 0);
		permanentMenuCategory2.addToItems(permanentMenuItem3)
		permanentMenuCategory2.addToItems(permanentMenuItem4)
		permanentMenuCategory2.save(flush:true)
		
		def permanentMenu = new PermanentMenu(originator: adminUser)
		permanentMenu.addToCategories(permanentMenuCategory1)
		permanentMenu.addToCategories(permanentMenuCategory2)
		permanentMenu.menu =  pernamentMenuJSON
		permanentMenu.save(flush:true)
		
		
		new WeekMenuAutocomplete(user: adminUser, name: "Kotlet schabowy z ziemniakami, sałatka z ogórków.", price: "12 zł" ).save(flush:true)
		new WeekMenuAutocomplete(user: adminUser, name: "Kotlet schabowy z frytkami", price: "12 zł" ).save(flush:true)
		new WeekMenuAutocomplete(user: adminUser, name: "Kotlet schabowy, sałatka warzywna", price: "12 zł" ).save(flush:true)
		new WeekMenuAutocomplete(user: adminUser, name: "Kotlet schabowy, ziemniakami, mizeria, lub sałatka z pomidorów ", price: "12 zł" ).save(flush:true)
		new WeekMenuAutocomplete(user: adminUser, name: "Kotlet schabowy, gotowane warzywa ", price: "12 zł" ).save(flush:true)
		new WeekMenuAutocomplete(user: adminUser, name: "Kurczak pieczony z warzywami ", price: "12 zł" ).save(flush:true)
		new WeekMenuAutocomplete(user: adminUser, name: "Kurczak pieczony ziemniaki ", price: "12 zł" ).save(flush:true)
		new WeekMenuAutocomplete(user: adminUser, name: "Smażony dorsz, frytki, sałatka ", price: "12 zł" ).save(flush:true)
		
		
		restaurant.permanentMenu = permanentMenu
		restaurant.save(flush:true)
		restaurant.addToImages(image1)
		restaurant.addToImages(image2)
		restaurant.addToImages(image3)
		restaurant.addToImages(image4)
		restaurant.addToImages(image5)
		restaurant.addToImages(image6)
		restaurant.addToImages(image7)
		restaurant.setMainImage(image2)
		restaurant.addToWeekMenus(new WeekMenu(menu: weekMenuJSON, yearWeek: MenuUtils.getCurrentYearWeek(), originator: restaurateurUser ))
		restaurant.save(flush:true)
		
		
		Restaurant restaurant2 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Skoczów", description: "Fajne miejsce", name: "Pizzeria Grilliata", originator: adminUser, postcode: "43-450", streetno: "Morcinka 16", region: Region.DOLNOSLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant2.addToTypes(type_cafe)
		restaurant2.addToTypes(type_pizzeria)
		restaurant2.addToCuisines(cuisine_polish)
		restaurant2.addToCuisines(cuisine_indian)
		restaurant2.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant2.addToImages(image1)
		restaurant2.addToImages(image2)
		restaurant2.addToImages(image3)
		restaurant2.setMainImage(image2)
		restaurant2.save(flush:true)
		
		Restaurant restaurant3 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Ustroń", description: "Fajne miejsce", name: "Koliba Pod Czarcim Kopytem", originator: adminUser, postcode: "43-450", streetno: "Równica 23", region: Region.DOLNOSLASKIE)
		restaurant3.addToTypes(type_restaurant)
		restaurant3.addToTypes(type_pizzeria)
		restaurant3.addToCuisines(cuisine_polish)
		restaurant3.addToCuisines(cuisine_mexican)
		restaurant3.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant3.addToImages(image1)
		restaurant3.addToImages(image2)
		restaurant3.addToImages(image3)
		restaurant3.setMainImage(image1)
		restaurant3.save(flush:true)
		
		Restaurant restaurant4 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Korbasowy Dwór", originator: adminUser, postcode: "43-400", streetno: "Hażlaska 135", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96" )
		restaurant4.addToTypes(type_restaurant)
		restaurant4.addToTypes(type_pizzeria)
		restaurant4.addToCuisines(cuisine_vegetarian)
		restaurant4.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant4.addToImages(image1)
		restaurant4.addToImages(image2)
		restaurant4.addToImages(image3)
		restaurant4.setMainImage(image3)
		restaurant4.save(flush:true)
		
		Restaurant restaurant5 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Cieszyński Browar Mieszczański", originator: adminUser, postcode: "43-400", streetno: "Ks. Ignacego Świeżego 6", region: Region.SLASKIE)
		restaurant5.addToTypes(type_restaurant)
		restaurant5.addToTypes(type_pizzeria)
		restaurant5.addToCuisines(cuisine_oldpolish)
		restaurant5.addToCuisines(cuisine_international)
		restaurant5.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant5.addToImages(image1)
		restaurant5.addToImages(image2)
		restaurant5.addToImages(image3)
		restaurant5.setMainImage(image2)
		restaurant5.save(flush:true)
		
		Restaurant restaurant6 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Restauracja Pod Brunatnym Jeleniem", originator: adminUser, postcode: "43-400", streetno: "Rynek 20", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant6.addToTypes(type_restaurant)
		restaurant6.addToTypes(type_pizzeria)
		restaurant6.addToCuisines(cuisine_polish)
		restaurant6.addToCuisines(cuisine_international)
		restaurant6.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant6.addToImages(image1)
		restaurant6.addToImages(image2)
		restaurant6.addToImages(image3)
		restaurant6.setMainImage(image2)
		restaurant6.save(flush:true)
		
		Restaurant restaurant7 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Pizzeria Bati", originator: adminUser, postcode: "43-400", streetno: "Mennicza 30", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant7.addToTypes(type_fastfood)
		restaurant7.addToTypes(type_pizzeria)
		restaurant7.addToCuisines(cuisine_oldpolish)
		restaurant7.addToCuisines(cuisine_international)
		restaurant7.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant7.addToImages(image1)
		restaurant7.addToImages(image2)
		restaurant7.addToImages(image3)
		restaurant7.setMainImage(image1)
		restaurant7.save(flush:true)
		
		Restaurant restaurant8 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Laja Herbaciarnia Zamkowa", originator: restaurateurUser, postcode: "43-400", streetno: "Zamkowa 3", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant8.addToTypes(type_restaurant)
		restaurant8.addToTypes(type_pizzeria)
		restaurant8.addToCuisines(cuisine_polish)
		restaurant8.addToCuisines(cuisine_international)
		restaurant8.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant8.addToImages(image1)
		restaurant8.addToImages(image2)
		restaurant8.addToImages(image3)
		restaurant8.setMainImage(image2)
		restaurant8.save(flush:true)
		
		Restaurant restaurant9 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Kawiarnia Herbowa", originator: restaurateurUser, postcode: "43-400", streetno: "Rynek 18", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant9.addToTypes(type_restaurant)
		restaurant9.addToTypes(type_pizzeria)
		restaurant9.addToCuisines(cuisine_polish)
		restaurant9.addToCuisines(cuisine_italian)
		restaurant9.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant9.addToImages(image1)
		restaurant9.addToImages(image2)
		restaurant9.addToImages(image3)
		restaurant9.setMainImage(image1)
		restaurant9.save(flush:true)
		
		Restaurant restaurant10 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Cukiernia Bajka", originator: restaurateurUser, postcode: "43-400", streetno: "Limanowskiego 9/3", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant10.addToTypes(type_restaurant)
		restaurant10.addToTypes(type_canteen)
		restaurant10.addToCuisines(cuisine_polish)
		restaurant10.addToCuisines(cuisine_italian)
		restaurant10.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant10.addToImages(image1)
		restaurant10.addToImages(image2)
		restaurant10.addToImages(image3)
		restaurant10.setMainImage(image2)
		restaurant10.save(flush:true)
		
		Restaurant restaurant11 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Restauracja Trzech Braci", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant11.addToTypes(type_restaurant)
		restaurant11.addToTypes(type_cafe)
		restaurant11.addToCuisines(cuisine_polish)
		restaurant11.addToCuisines(cuisine_chinese)
		restaurant11.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant11.addToImages(image1)
		restaurant11.addToImages(image2)
		restaurant11.addToImages(image3)
		restaurant11.setMainImage(image2)
		restaurant11.save(flush:true)
		
		Restaurant restaurant12 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Sadyba", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant12.addToTypes(type_restaurant)
		restaurant12.addToTypes(type_cafe)
		restaurant12.addToCuisines(cuisine_polish)
		restaurant12.addToCuisines(cuisine_chinese)
		restaurant12.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant12.addToImages(image1)
		restaurant12.addToImages(image2)
		restaurant12.addToImages(image3)
		restaurant12.setMainImage(image1)
		restaurant12.save(flush:true)
		
		Restaurant restaurant13 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Griliata Pizzeria Maciej Małysz", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant13.addToTypes(type_restaurant)
		restaurant13.addToTypes(type_cafe)
		restaurant13.addToCuisines(cuisine_polish)
		restaurant13.addToCuisines(cuisine_chinese)
		restaurant13.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant13.addToImages(image1)
		restaurant13.addToImages(image2)
		restaurant13.addToImages(image3)
		restaurant13.setMainImage(image3)
		restaurant13.save(flush:true)
		
		Restaurant restaurant14 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Blues Night Club", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant14.addToTypes(type_restaurant)
		restaurant14.addToTypes(type_cafe)
		restaurant14.addToCuisines(cuisine_polish)
		restaurant14.addToCuisines(cuisine_chinese)
		restaurant14.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant14.addToImages(image1)
		restaurant14.addToImages(image2)
		restaurant14.addToImages(image3)
		restaurant14.setMainImage(image2)
		restaurant14.save(flush:true)
		
		Restaurant restaurant15 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Kofeina", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant15.addToTypes(type_restaurant)
		restaurant15.addToTypes(type_cafe)
		restaurant15.addToCuisines(cuisine_polish)
		restaurant15.addToCuisines(cuisine_chinese)
		restaurant15.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant15.addToImages(image1)
		restaurant15.addToImages(image2)
		restaurant15.addToImages(image3)
		restaurant15.setMainImage(image3)
		restaurant15.save(flush:true)
		
		Restaurant restaurant16 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Nova", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant16.addToTypes(type_restaurant)
		restaurant16.addToTypes(type_cafe)
		restaurant16.addToCuisines(cuisine_polish)
		restaurant16.addToCuisines(cuisine_chinese)
		restaurant16.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant16.addToImages(image1)
		restaurant16.addToImages(image2)
		restaurant16.addToImages(image3)
		restaurant16.setMainImage(image2)
		restaurant16.save(flush:true)
		
		Restaurant restaurant17 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Star Kebap & Pizza", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant17.addToTypes(type_restaurant)
		restaurant17.addToTypes(type_cafe)
		restaurant17.addToCuisines(cuisine_polish)
		restaurant17.addToCuisines(cuisine_chinese)
		restaurant17.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant17.addToImages(image1)
		restaurant17.addToImages(image2)
		restaurant17.addToImages(image3)
		restaurant17.setMainImage(image1)
		restaurant17.save(flush:true)
		
		Restaurant restaurant18 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Mr Hamburger", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant18.addToTypes(type_restaurant)
		restaurant18.addToTypes(type_cafe)
		restaurant18.addToCuisines(cuisine_polish)
		restaurant18.addToCuisines(cuisine_chinese)
		restaurant18.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant18.addToImages(image1)
		restaurant18.addToImages(image2)
		restaurant18.addToImages(image3)
		restaurant18.setMainImage(image2)
		restaurant18.save(flush:true)
		
		Restaurant restaurant19 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Pizzeria La Nostra (przeniesiony)", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant19.addToTypes(type_restaurant)
		restaurant19.addToTypes(type_cafe)
		restaurant19.addToCuisines(cuisine_polish)
		restaurant19.addToCuisines(cuisine_chinese)
		restaurant19.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant19.addToImages(image1)
		restaurant19.addToImages(image2)
		restaurant19.addToImages(image3)
		restaurant19.setMainImage(image3)
		restaurant19.save(flush:true)
		
		Restaurant restaurant20 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Oberża Pod Czerwonym Wieprzem", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant20.addToTypes(type_restaurant)
		restaurant20.addToTypes(type_cafe)
		restaurant20.addToCuisines(cuisine_polish)
		restaurant20.addToCuisines(cuisine_chinese)
		restaurant20.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant20.addToImages(image1)
		restaurant20.addToImages(image2)
		restaurant20.addToImages(image3)
		restaurant20.setMainImage(image2)
		restaurant20.save(flush:true)
		
		Restaurant restaurant21 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Santorini", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant21.addToTypes(type_restaurant)
		restaurant21.addToTypes(type_cafe)
		restaurant21.addToCuisines(cuisine_polish)
		restaurant21.addToCuisines(cuisine_chinese)
		restaurant21.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant21.addToImages(image1)
		restaurant21.addToImages(image2)
		restaurant21.addToImages(image3)
		restaurant21.setMainImage(image3)
		restaurant21.save(flush:true)
		
		Restaurant restaurant22 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Trattoria Włoska Chianti", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant22.addToTypes(type_restaurant)
		restaurant22.addToTypes(type_cafe)
		restaurant22.addToCuisines(cuisine_polish)
		restaurant22.addToCuisines(cuisine_chinese)
		restaurant22.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant22.addToImages(image1)
		restaurant22.addToImages(image2)
		restaurant22.addToImages(image3)
		restaurant22.setMainImage(image1)
		restaurant22.save(flush:true)
		
		Restaurant restaurant23 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Frida", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant23.addToTypes(type_restaurant)
		restaurant23.addToTypes(type_cafe)
		restaurant23.addToCuisines(cuisine_polish)
		restaurant23.addToCuisines(cuisine_chinese)
		restaurant23.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant23.addToImages(image1)
		restaurant23.addToImages(image2)
		restaurant23.addToImages(image3)
		restaurant23.setMainImage(image3)
		restaurant23.save(flush:true)
		
		Restaurant restaurant24 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Sushi Zushi", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant24.addToTypes(type_restaurant)
		restaurant24.addToTypes(type_cafe)
		restaurant24.addToCuisines(cuisine_polish)
		restaurant24.addToCuisines(cuisine_chinese)
		restaurant24.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant24.addToImages(image1)
		restaurant24.addToImages(image2)
		restaurant24.addToImages(image3)
		restaurant24.setMainImage(image2)
		restaurant24.save(flush:true)
		
		Restaurant restaurant25 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Aioli Cantine Bar Cafe Deli", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant25.addToTypes(type_restaurant)
		restaurant25.addToTypes(type_cafe)
		restaurant25.addToCuisines(cuisine_polish)
		restaurant25.addToCuisines(cuisine_chinese)
		restaurant25.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant25.addToImages(image1)
		restaurant25.addToImages(image2)
		restaurant25.addToImages(image3)
		restaurant25.setMainImage(image3)
		restaurant25.save(flush:true)
		
		Restaurant restaurant26 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Restauracja Meltemi", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant26.addToTypes(type_restaurant)
		restaurant26.addToTypes(type_cafe)
		restaurant26.addToCuisines(cuisine_polish)
		restaurant26.addToCuisines(cuisine_chinese)
		restaurant26.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant26.addToImages(image1)
		restaurant26.addToImages(image2)
		restaurant26.addToImages(image3)
		restaurant26.setMainImage(image2)
		restaurant26.save(flush:true)
		
		Restaurant restaurant27 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Butchery & Wine", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant27.addToTypes(type_restaurant)
		restaurant27.addToTypes(type_cafe)
		restaurant27.addToCuisines(cuisine_polish)
		restaurant27.addToCuisines(cuisine_chinese)
		restaurant27.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant27.save(flush:true)
		
		Restaurant restaurant28 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Restauracja Polska Różana", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant28.addToTypes(type_restaurant)
		restaurant28.addToTypes(type_cafe)
		restaurant28.addToCuisines(cuisine_polish)
		restaurant28.addToCuisines(cuisine_chinese)
		restaurant28.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant28.save(flush:true)
		
		Restaurant restaurant29 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Tandoor", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant29.addToTypes(type_restaurant)
		restaurant29.addToTypes(type_cafe)
		restaurant29.addToCuisines(cuisine_polish)
		restaurant29.addToCuisines(cuisine_chinese)
		restaurant29.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant29.save(flush:true)
		
		Restaurant restaurant30 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Five Restaurant", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant30.addToTypes(type_restaurant)
		restaurant30.addToTypes(type_cafe)
		restaurant30.addToCuisines(cuisine_polish)
		restaurant30.addToCuisines(cuisine_chinese)
		restaurant30.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant30.save(flush:true)
		
		Restaurant restaurant31 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Mielżyński Wine Bar", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant31.addToTypes(type_restaurant)
		restaurant31.addToTypes(type_cafe)
		restaurant31.addToCuisines(cuisine_polish)
		restaurant31.addToCuisines(cuisine_chinese)
		restaurant31.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant31.save(flush:true)
		
		Restaurant restaurant32 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Restauracja Papaya", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant32.addToTypes(type_restaurant)
		restaurant32.addToTypes(type_cafe)
		restaurant32.addToCuisines(cuisine_polish)
		restaurant32.addToCuisines(cuisine_chinese)
		restaurant32.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant32.save(flush:true)
		
		Restaurant restaurant33 = new Restaurant(status: RestaurantStatus.ACTIVE, city: "Cieszyn", description: "Fajne miejsce", name: "Opasły Tom", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant33.addToTypes(type_restaurant)
		restaurant33.addToTypes(type_cafe)
		restaurant33.addToCuisines(cuisine_polish)
		restaurant33.addToCuisines(cuisine_chinese)
		restaurant33.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant33.save(flush:true)
		
		Restaurant restaurant34 = new Restaurant(status: RestaurantStatus.DISABLED, city: "Cieszyn", description: "Fajne miejsce", name: "Amrit Kebab", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant34.addToTypes(type_restaurant)
		restaurant34.addToTypes(type_cafe)
		restaurant34.addToCuisines(cuisine_polish)
		restaurant34.addToCuisines(cuisine_chinese)
		restaurant34.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant34.save(flush:true)
		
		Restaurant restaurant35 = new Restaurant(status: RestaurantStatus.NEW, city: "Cieszyn", description: "Fajne miejsce", name: "Bistecca Bistro", originator: restaurateurUser, postcode: "43-400", streetno: "Motelowa 1A", region: Region.SLASKIE, webpage:"www.kamienica-konczakowskich.pl", mail:"info@kamienica-konczakowskich.pl", phone1:"33 852 18 96", latitude: "49.749232", longitude: "18.63314200000002")
		restaurant35.addToTypes(type_restaurant)
		restaurant35.addToTypes(type_cafe)
		restaurant35.addToCuisines(cuisine_polish)
		restaurant35.addToCuisines(cuisine_chinese)
		restaurant35.permanentMenu = new PermanentMenu(menu: pernamentMenuJSON, originator: restaurateurUser)
		restaurant35.save(flush:true)
		
		
		new Recommended(restaurant: restaurant).save(flush:true)
		new Recommended(restaurant: restaurant2).save(flush:true)
		new Recommended(restaurant: restaurant3).save(flush:true)

    }
}
