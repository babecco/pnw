package pnw

class PessoaFisicaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pessoaFisicaInstanceList: PessoaFisica.list(params), pessoaFisicaInstanceTotal: PessoaFisica.count()]
    }

    def create = {
        def pessoaFisicaInstance = new PessoaFisica()
        pessoaFisicaInstance.properties = params
        return [pessoaFisicaInstance: pessoaFisicaInstance]
    }

    def save = {
        def pessoaFisicaInstance = new PessoaFisica(params)
        if (pessoaFisicaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'pessoaFisica.label', default: 'PessoaFisica'), pessoaFisicaInstance.id])}"
            redirect(action: "show", id: pessoaFisicaInstance.id)
        }
        else {
            render(view: "create", model: [pessoaFisicaInstance: pessoaFisicaInstance])
        }
    }

    def show = {
        def pessoaFisicaInstance = PessoaFisica.get(params.id)
        if (!pessoaFisicaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pessoaFisica.label', default: 'PessoaFisica'), params.id])}"
            redirect(action: "list")
        }
        else {
            [pessoaFisicaInstance: pessoaFisicaInstance]
        }
    }

    def edit = {
        def pessoaFisicaInstance = PessoaFisica.get(params.id)
        if (!pessoaFisicaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pessoaFisica.label', default: 'PessoaFisica'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [pessoaFisicaInstance: pessoaFisicaInstance]
        }
    }

    def update = {
        def pessoaFisicaInstance = PessoaFisica.get(params.id)
        if (pessoaFisicaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (pessoaFisicaInstance.version > version) {
                    
                    pessoaFisicaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'pessoaFisica.label', default: 'PessoaFisica')] as Object[], "Another user has updated this PessoaFisica while you were editing")
                    render(view: "edit", model: [pessoaFisicaInstance: pessoaFisicaInstance])
                    return
                }
            }
            pessoaFisicaInstance.properties = params
            if (!pessoaFisicaInstance.hasErrors() && pessoaFisicaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'pessoaFisica.label', default: 'PessoaFisica'), pessoaFisicaInstance.id])}"
                redirect(action: "show", id: pessoaFisicaInstance.id)
            }
            else {
                render(view: "edit", model: [pessoaFisicaInstance: pessoaFisicaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pessoaFisica.label', default: 'PessoaFisica'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def pessoaFisicaInstance = PessoaFisica.get(params.id)
        if (pessoaFisicaInstance) {
            try {
                pessoaFisicaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'pessoaFisica.label', default: 'PessoaFisica'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'pessoaFisica.label', default: 'PessoaFisica'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pessoaFisica.label', default: 'PessoaFisica'), params.id])}"
            redirect(action: "list")
        }
    }
}
