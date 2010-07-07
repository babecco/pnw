package pnw

class PessoaJuridicaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pessoaJuridicaInstanceList: PessoaJuridica.list(params), pessoaJuridicaInstanceTotal: PessoaJuridica.count()]
    }

    def create = {
        def pessoaJuridicaInstance = new PessoaJuridica()
        pessoaJuridicaInstance.properties = params
        return [pessoaJuridicaInstance: pessoaJuridicaInstance]
    }

    def save = {
        def pessoaJuridicaInstance = new PessoaJuridica(params)
        if (pessoaJuridicaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'pessoaJuridica.label', default: 'PessoaJuridica'), pessoaJuridicaInstance.id])}"
            redirect(action: "show", id: pessoaJuridicaInstance.id)
        }
        else {
            render(view: "create", model: [pessoaJuridicaInstance: pessoaJuridicaInstance])
        }
    }

    def show = {
        def pessoaJuridicaInstance = PessoaJuridica.get(params.id)
        if (!pessoaJuridicaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pessoaJuridica.label', default: 'PessoaJuridica'), params.id])}"
            redirect(action: "list")
        }
        else {
            [pessoaJuridicaInstance: pessoaJuridicaInstance]
        }
    }

    def edit = {
        def pessoaJuridicaInstance = PessoaJuridica.get(params.id)
        if (!pessoaJuridicaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pessoaJuridica.label', default: 'PessoaJuridica'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [pessoaJuridicaInstance: pessoaJuridicaInstance]
        }
    }

    def update = {
        def pessoaJuridicaInstance = PessoaJuridica.get(params.id)
        if (pessoaJuridicaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (pessoaJuridicaInstance.version > version) {
                    
                    pessoaJuridicaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'pessoaJuridica.label', default: 'PessoaJuridica')] as Object[], "Another user has updated this PessoaJuridica while you were editing")
                    render(view: "edit", model: [pessoaJuridicaInstance: pessoaJuridicaInstance])
                    return
                }
            }
            pessoaJuridicaInstance.properties = params
            if (!pessoaJuridicaInstance.hasErrors() && pessoaJuridicaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'pessoaJuridica.label', default: 'PessoaJuridica'), pessoaJuridicaInstance.id])}"
                redirect(action: "show", id: pessoaJuridicaInstance.id)
            }
            else {
                render(view: "edit", model: [pessoaJuridicaInstance: pessoaJuridicaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pessoaJuridica.label', default: 'PessoaJuridica'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def pessoaJuridicaInstance = PessoaJuridica.get(params.id)
        if (pessoaJuridicaInstance) {
            try {
                pessoaJuridicaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'pessoaJuridica.label', default: 'PessoaJuridica'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'pessoaJuridica.label', default: 'PessoaJuridica'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pessoaJuridica.label', default: 'PessoaJuridica'), params.id])}"
            redirect(action: "list")
        }
    }
}
