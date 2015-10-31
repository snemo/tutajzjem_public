package pl.tutajzjem.restaurant.menu

class MenuTagLib {
    static defaultEncodeAs = 'html'
    //static encodeAsForTags = [tagName: 'raw']
	static namespace = "menu"
	
	def currentYearWeek = { attrs, body ->
		out << MenuUtils.getCurrentYearWeek()
	}
}
