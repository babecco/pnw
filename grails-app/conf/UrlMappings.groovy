class UrlMappings {

	static mappings = {

		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/" (controller:"pnw.user")
		"/licitacao" (controller:"pnw.licitacao")
		"/"(view:"/index")
		"500"(view:'/error')
	}
}
