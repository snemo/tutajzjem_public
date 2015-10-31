package pl.tutajzjem.restaurant

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.ListUtils;
import org.apache.commons.lang.StringUtils;

import grails.plugins.SlugGeneratorService;
import groovy.transform.ToString;
import pl.tutajzjem.attachment.Image;
import pl.tutajzjem.restaurant.menu.MenuUtils;
import pl.tutajzjem.restaurant.menu.PermanentMenu;
import pl.tutajzjem.restaurant.menu.WeekMenu;
import pl.tutajzjem.security.Region
import pl.tutajzjem.security.SecUser;

@ToString(includeNames=true,includeFields=true,excludes="mainImage,permanentMenu,slugGeneratorService,monday,mondayOpen,mondayClosed,tuesday,tuesdayOpen,tuesdayClosed,wednesday,wednesdayOpen,wednesdayClosed,thursday,thursdayOpen,thursdayClosed,friday,fridayOpen,fridayClosed,saturday,saturdayOpen,saturdayClosed,sunday,sundayOpen,sundayClosed")
class Restaurant {
	
	def slugGeneratorService
	
	SecUser originator
	RestaurantStatus status = RestaurantStatus.NEW
	String name
	String description
	String latitude
	String longitude
	Region region
	String city
	String postcode
	String streetno
	String webpage
	String mail
	String phone1
	String phone2
	Image mainImage
	PermanentMenu permanentMenu
	String typesList                      // duplicated - types; for search optimization; use only types
	String cuisinesList                   // duplicated - cuisines; for search optimization; use only cuisines
	byte promotionRank = 0                // marking restaurant as promoted/recommended
		
	//open hours
	boolean monday = true
	Date mondayOpen = RestaurantUtils.getOpenDefaultDate()
	Date mondayClosed = RestaurantUtils.getCloseDefaultDate()
	boolean tuesday = true
	Date tuesdayOpen = RestaurantUtils.getOpenDefaultDate()
	Date tuesdayClosed = RestaurantUtils.getCloseDefaultDate()
	boolean wednesday = true
	Date wednesdayOpen = RestaurantUtils.getOpenDefaultDate()
	Date wednesdayClosed = RestaurantUtils.getCloseDefaultDate()
	boolean thursday = true
	Date thursdayOpen = RestaurantUtils.getOpenDefaultDate()
	Date thursdayClosed = RestaurantUtils.getCloseDefaultDate()
	boolean friday = true
	Date fridayOpen = RestaurantUtils.getOpenDefaultDate()
	Date fridayClosed = RestaurantUtils.getCloseDefaultDate()
	boolean saturday = true
	Date saturdayOpen = RestaurantUtils.getOpenDefaultDate()
	Date saturdayClosed = RestaurantUtils.getCloseDefaultDate()
	boolean sunday = true
	Date sundayOpen = RestaurantUtils.getOpenDefaultDate()
	Date sundayClosed = RestaurantUtils.getCloseDefaultDate()
	
	//lunch default open hours
	Date mondayLunchOpen = RestaurantUtils.getLuchOpenDefaultDate()
	Date mondayLunchClosed = RestaurantUtils.getLunchCloseDefaultDate()
	Date tuesdayLunchOpen = RestaurantUtils.getLuchOpenDefaultDate()
	Date tuesdayLunchClosed = RestaurantUtils.getLunchCloseDefaultDate()
	Date wednesdayLunchOpen = RestaurantUtils.getLuchOpenDefaultDate()
	Date wednesdayLunchClosed = RestaurantUtils.getLunchCloseDefaultDate()
	Date thursdayLunchOpen = RestaurantUtils.getLuchOpenDefaultDate()
	Date thursdayLunchClosed = RestaurantUtils.getLunchCloseDefaultDate()
	Date fridayLunchOpen = RestaurantUtils.getLuchOpenDefaultDate()
	Date fridayLunchClosed = RestaurantUtils.getLunchCloseDefaultDate()
	Date saturdayLunchOpen = RestaurantUtils.getLuchOpenDefaultDate()
	Date saturdayLunchClosed = RestaurantUtils.getLunchCloseDefaultDate()
	Date sundayLunchOpen = RestaurantUtils.getLuchOpenDefaultDate()
	Date sundayLunchClosed = RestaurantUtils.getLunchCloseDefaultDate()
	
	
	Date dateCreated
	Date lastUpdated
	String identifier //SEO, URL - friendly unique name
	
	static hasMany = [types:RestaurantType, cuisines:Cuisine, images:Image, weekMenus:WeekMenu]
	SortedSet<Image> images
	
    static constraints = {
		latitude(nullable: true, blank:true)
		longitude(nullable: true, blank:true)
		webpage(nullable: true, blank:true)
		mail(nullable: true, blank:true)
		phone1(nullable: true, blank:true)
		phone2(nullable: true, blank:true)
		mainImage(nullable: true, blank:true)
		permanentMenu(nullable: true, blank:true)
		identifier(nullable: true, blank:true)
		typesList(nullable: true, blank:true)
		cuisinesList(nullable: true, blank:true)
		
		mondayOpen(nullable: true, blank:true)
		mondayClosed(nullable: true, blank:true)
		tuesdayOpen(nullable: true, blank:true)
		tuesdayClosed(nullable: true, blank:true)
		wednesdayOpen(nullable: true, blank:true)
		wednesdayClosed(nullable: true, blank:true)
		thursdayOpen(nullable: true, blank:true)
		thursdayClosed(nullable: true, blank:true)
		fridayOpen(nullable: true, blank:true)
		fridayClosed(nullable: true, blank:true)
		saturdayOpen(nullable: true, blank:true)
		saturdayClosed(nullable: true, blank:true)
		sundayOpen(nullable: true, blank:true)
		sundayClosed(nullable: true, blank:true)
    }
	
	static mapping = {
		description length: 32768
		images lazy: false
		weekMenus lazy: true
	}
	
	//static transients = ['currentWeekMenu']
	
	
	static Restaurant findByImages(Image image) {
		return Restaurant.createCriteria().get {
			images {
				eq("identifier", image.identifier)
			}
		}
	}
	
	def beforeInsert() {
		this.identifier = slugGeneratorService.generateSlug(this.class, "identifier", name)
		this.typesList = types.inject([]) {result, type -> result << type.name}.join(",")
		this.cuisinesList = cuisines.inject([]) {result, cuisine -> result << cuisine.name}.join(",")
	}

	def beforeUpdate() {
		if (isDirty('name')) {
			this.identifier = slugGeneratorService.generateSlug(this.class, "identifier", name)
		}
		this.typesList = types.inject([]) {result, type -> result << type.name}.join(",")
		this.cuisinesList = cuisines.inject([]) {result, cuisine -> result << cuisine.name}.join(",")
	}
	
	boolean isOpenToday() {
		switch(RestaurantUtils.getCurrentWeekDay()) {
			case 1: return sunday
			case 2: return monday
			case 3: return tuesday
			case 4: return wednesday
			case 5: return thursday
			case 6: return friday
			case 7: return saturday
			default: return false
		}
	}
	
	Date getTodayOpenHour() {
		switch(RestaurantUtils.getCurrentWeekDay()) {
			case 1: return sundayOpen
			case 2: return mondayOpen
			case 3: return tuesdayOpen
			case 4: return wednesdayOpen
			case 5: return thursdayOpen
			case 6: return fridayOpen
			case 7: return saturdayOpen
			default: return false
		}
	}
	
	Date getTodayCloseHour() {
		switch(RestaurantUtils.getCurrentWeekDay()) {
			case 1: return sundayClosed
			case 2: return mondayClosed
			case 3: return tuesdayClosed
			case 4: return wednesdayClosed
			case 5: return thursdayClosed
			case 6: return fridayClosed
			case 7: return saturdayOpen
			default: return false
		}
	}
	
	WeekMenu getCurrentWeekMenu() {
			return WeekMenu.findByRestaurantAndYearWeek(this, MenuUtils.getCurrentYearWeek())
	}
	
	List<String> getTypeLabelList() {
		if(StringUtils.isEmpty(typesList)) {
			return ListUtils.EMPTY_LIST
		}
		List<String> typeLabels = new ArrayList<String>()
		for ( String typeName : typesList.split(",") ) {
			typeLabels.add(RestaurantType.findByName(typeName)?.defaultTransaltion)
		}
		return typeLabels
	}
	
	List<String> getcuisineLabelList() {
		if(StringUtils.isEmpty(cuisinesList)) {
			return ListUtils.EMPTY_LIST
		}
		List<String> cuisineLabels = new ArrayList<String>()
		for ( String cuisineName : cuisinesList.split(",") ) {
			cuisineLabels.add(Cuisine.findByName(cuisineName)?.defaultTransaltion)
		}
		return cuisineLabels
	}
}
