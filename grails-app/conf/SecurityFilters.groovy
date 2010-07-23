class SecurityFilters {
	def filters = {
		loginCheck(controller:'*', action:'*') {
			before = {
				if(!session.user && actionName != "login") {
					if(controllerName == "user" && actionName == "create"){
						return true
					}else{
						redirect(controller:"user",action:"login")
						return false					
					}
				}
			}
		}
	}
}
