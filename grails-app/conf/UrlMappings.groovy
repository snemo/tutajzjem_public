class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

		//main page HOME
        "/"(controller:"home")
		
		//restaurant page
		name restaurant: "/lokal/$id"{
			controller="home" 
			action="restaurant"
        }
		
		"500"(view:'/error')
	}
}
