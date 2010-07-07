package pnw

class EspecificacaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [especificacaoInstanceList: Especificacao.list(params), especificacaoInstanceTotal: Especificacao.count()]
    }

    def create = {
        def especificacaoInstance = new Especificacao()
        especificacaoInstance.properties = params
        return [especificacaoInstance: especificacaoInstance]
    }

    def save = {
        def especificacaoInstance = new Especificacao(params)
        if (especificacaoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'especificacao.label', default: 'Especificacao'), especificacaoInstance.id])}"
            redirect(action: "show", id: especificacaoInstance.id)
        }
        else {
            render(view: "create", model: [especificacaoInstance: especificacaoInstance])
        }
    }

    def show = {
        def especificacaoInstance = Especificacao.get(params.id)
        if (!especificacaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'especificacao.label', default: 'Especificacao'), params.id])}"
            redirect(action: "list")
        }
        else {
            [especificacaoInstance: especificacaoInstance]
        }
    }

    def edit = {
        def especificacaoInstance = Especificacao.get(params.id)
        if (!especificacaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'especificacao.label', default: 'Especificacao'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [especificacaoInstance: especificacaoInstance]
        }
    }

    def update = {
        def especificacaoInstance = Especificacao.get(params.id)
        if (especificacaoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (especificacaoInstance.version > version) {
                    
                    especificacaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'especificacao.label', default: 'Especificacao')] as Object[], "Another user has updated this Especificacao while you were editing")
                    render(view: "edit", model: [especificacaoInstance: especificacaoInstance])
                    return
                }
            }
            especificacaoInstance.properties = params
            if (!especificacaoInstance.hasErrors() && especificacaoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'especificacao.label', default: 'Especificacao'), especificacaoInstance.id])}"
                redirect(action: "show", id: especificacaoInstance.id)
            }
            else {
                render(view: "edit", model: [especificacaoInstance: especificacaoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'especificacao.label', default: 'Especificacao'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def especificacaoInstance = Especificacao.get(params.id)
        if (especificacaoInstance) {
            try {
                especificacaoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'especificacao.label', default: 'Especificacao'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'especificacao.label', default: 'Especificacao'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'especificacao.label', default: 'Especificacao'), params.id])}"
            redirect(action: "list")
        }
    }
}
