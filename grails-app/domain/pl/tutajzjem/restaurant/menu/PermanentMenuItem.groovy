package pl.tutajzjem.restaurant.menu

class PermanentMenuItem {

	String name
	String price
	String description
	int position
	
	static belongsTo = PermanentMenuCategory
	
    static constraints = {
		price(nullable: true, blank:true)
		description(nullable: true, blank:true)
    }
	
	static mapping = {
		description length: 2048
	}
}
