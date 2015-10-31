package pl.tutajzjem.restaurant.menu

class WeekMenuItem {

    String name
	String price
	int position = 0;
	
	static belongsTo = WeekMenuDay
	
    static constraints = {
		price(nullable: true, blank:true)
    }
	
	static mapping = {
		name length: 1024
	}
}
