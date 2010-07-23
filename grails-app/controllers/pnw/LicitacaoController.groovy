package pnw

class LicitacaoController {

    static allowedMethods = [update: "POST", delete: "POST"]

	def crudService

	def index = {
		render(view:"create")
	}

	def landing = {
		render(view:"landing")
	}

	def create = {
		if(request.get){ 
			render (view:"create")
		} else {
			def tags = [params.tag1, params.tag2, params.tag3]
			def categoria = Categoria.get(params.categoria)
			def licitacao = crudService.createLicitacao(tags, session.user, params.edital, categoria, params.fimPrimeiraFase)
	
			if(licitacao.hasErrors()) {
				render(view:"create",model:[itemInstance:licitacao])
			} else {
				flash.message = "Cadastro concluído com sucesso!"
				render(view:"landing",model:[itemInstance:licitacao])
			}
		}
	}

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [licitacaoInstanceList: Licitacao.list(params), licitacaoInstanceTotal: Licitacao.count()]
    }

    def save = {
        def licitacaoInstance = new Licitacao(params)
        if (licitacaoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'licitacao.label', default: 'Licitacao'), licitacaoInstance.id])}"
            redirect(action: "show", id: licitacaoInstance.id)
        }
        else {
            render(view: "create", model: [licitacaoInstance: licitacaoInstance])
        }
    }

    def show = {
        def licitacaoInstance = Licitacao.get(params.id)
        if (!licitacaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'licitacao.label', default: 'Licitacao'), params.id])}"
            redirect(action: "list")
        }
        else {
            [licitacaoInstance: licitacaoInstance]
        }
    }

    def edit = {
        def licitacaoInstance = Licitacao.get(params.id)
        if (!licitacaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'licitacao.label', default: 'Licitacao'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [licitacaoInstance: licitacaoInstance]
        }
    }

    def update = {
        def licitacaoInstance = Licitacao.get(params.id)
        if (licitacaoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (licitacaoInstance.version > version) {
                    
                    licitacaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'licitacao.label', default: 'Licitacao')] as Object[], "Another user has updated this Licitacao while you were editing")
                    render(view: "edit", model: [licitacaoInstance: licitacaoInstance])
                    return
                }
            }
            licitacaoInstance.properties = params
            if (!licitacaoInstance.hasErrors() && licitacaoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'licitacao.label', default: 'Licitacao'), licitacaoInstance.id])}"
                redirect(action: "show", id: licitacaoInstance.id)
            }
            else {
                render(view: "edit", model: [licitacaoInstance: licitacaoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'licitacao.label', default: 'Licitacao'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def licitacaoInstance = Licitacao.get(params.id)
        if (licitacaoInstance) {
            try {
                licitacaoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'licitacao.label', default: 'Licitacao'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'licitacao.label', default: 'Licitacao'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'licitacao.label', default: 'Licitacao'), params.id])}"
            redirect(action: "list")
        }
    }
}
