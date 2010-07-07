package pnw

class PropostaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [propostaInstanceList: Proposta.list(params), propostaInstanceTotal: Proposta.count()]
    }

    def create = {
        def propostaInstance = new Proposta()
        propostaInstance.properties = params
        return [propostaInstance: propostaInstance]
    }

    def save = {
        def propostaInstance = new Proposta(params)
        if (propostaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'proposta.label', default: 'Proposta'), propostaInstance.id])}"
            redirect(action: "show", id: propostaInstance.id)
        }
        else {
            render(view: "create", model: [propostaInstance: propostaInstance])
        }
    }

    def show = {
        def propostaInstance = Proposta.get(params.id)
        if (!propostaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'proposta.label', default: 'Proposta'), params.id])}"
            redirect(action: "list")
        }
        else {
            [propostaInstance: propostaInstance]
        }
    }

    def edit = {
        def propostaInstance = Proposta.get(params.id)
        if (!propostaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'proposta.label', default: 'Proposta'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [propostaInstance: propostaInstance]
        }
    }

    def update = {
        def propostaInstance = Proposta.get(params.id)
        if (propostaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (propostaInstance.version > version) {
                    
                    propostaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'proposta.label', default: 'Proposta')] as Object[], "Another user has updated this Proposta while you were editing")
                    render(view: "edit", model: [propostaInstance: propostaInstance])
                    return
                }
            }
            propostaInstance.properties = params
            if (!propostaInstance.hasErrors() && propostaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'proposta.label', default: 'Proposta'), propostaInstance.id])}"
                redirect(action: "show", id: propostaInstance.id)
            }
            else {
                render(view: "edit", model: [propostaInstance: propostaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'proposta.label', default: 'Proposta'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def propostaInstance = Proposta.get(params.id)
        if (propostaInstance) {
            try {
                propostaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'proposta.label', default: 'Proposta'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'proposta.label', default: 'Proposta'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'proposta.label', default: 'Proposta'), params.id])}"
            redirect(action: "list")
        }
    }
}
