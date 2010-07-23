package pnw

class UserController {

    static allowedMethods = [update: "POST", delete: "POST"]

	def crudService

    def index = {
        if(!session.user){
        	if(User.count() == 0){
	        	render(view:"create")
        	}else{
        		render(view:"login")
        	}
        }else{
        	render(controller:"pnw.licitacao")        
        }
    }
    
    def create = {
    	if(request.get){
    		render(view:"create")
    		return
    	}
    	def userType = params.typeCadastro
    	def user
    	if(params.password == params.confirm){
			if(userType == "fisica") {
				user = crudService.createPessoaFisica(params.username,params.password, params.email,params.cpf,params.name)
			} else if (userType == "juridica") {
				user = crudService.createPessoaJuridica(params.username,params.senha,params.email,params.cnpj,params.razaoSocial)
			} else {
				log.warning "userType unknow!"
				redirect(view:"/error")
			}
				
			if(user.hasErrors()) {
				render(view:"create",model:[itemInstance:user])
			} else {
				flash.message = "Cadastro concluído com sucesso!"
				render(view:"create",model:[itemInstance:user])
			}
			
		}else{
			flash.message = "Preencha a mesma senha nos dois campos."
			render(view:"create",model:[itemInstance:user])
		}
    }
    
    def login = {
    	if(request.get){
    		render(view:"login")
    	}else{
			def u = User.findByUsername(params.username)
			if(u.senha == params.password){
				session["user"] = u
				flash.message = "Usuário logado com sucesso"
				redirect(controller:"pnw.licitacao")
			}else{
				flash.message = "Usuário ou senha incorretos"
				render(view:"login", model:[itemInstance:user])
			}
    	}
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

//    def save = {
//        def userInstance = new User(params)
//        if (userInstance.save(flush: true)) {
//            flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
//            redirect(action: "show", id: userInstance.id)
//        }
//        else {
//            render(view: "create", model: [userInstance: userInstance])
//        }
//    }

    def show = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            [userInstance: userInstance]
        }
    }

    def edit = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userInstance: userInstance]
        }
    }

//    def update = {
//        def userInstance = User.get(params.id)
//        if (userInstance) {
//            if (params.version) {
//                def version = params.version.toLong()
//                if (userInstance.version > version) {
//                    
//                    userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
//                    render(view: "edit", model: [userInstance: userInstance])
//                    return
//                }
//            }
//            userInstance.properties = params
//            if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
//                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
//                redirect(action: "show", id: userInstance.id)
//            }
//            else {
//                render(view: "edit", model: [userInstance: userInstance])
//            }
//        }
//        else {
//            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
//            redirect(action: "list")
//        }
//    }

    def delete = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            try {
                userInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }
}

