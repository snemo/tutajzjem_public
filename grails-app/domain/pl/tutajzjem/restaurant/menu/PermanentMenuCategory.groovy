package pl.tutajzjem.restaurant.menu

class PermanentMenuCategory {

	String name
	int position
	
	static hasMany = [items:PermanentMenuItem]
	static belongsTo = PermanentMenu
	
    static constraints = {
    }
	
	static mapping = {
		items cascade: 'all-delete-orphan'
	}
}
