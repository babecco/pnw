class UrlMappings {

	static mappings = {
		"/" (controller:"pnw.user")

		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

//		"/"(view:"/index")
		"500"(view:'/error')
	}
}
