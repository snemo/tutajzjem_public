package pl.tutajzjem.restaurant

class Cuisine {

    String name
	String defaultTransaltion
	int priority = 0

	static mapping = {
		id generator: 'assigned', name: "name", type: 'string'
		sort priority: "desc"
	}
	
	@Override
	public String toString() {
		return defaultTransaltion
	}
}
