package pnw

class LoteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [loteInstanceList: Lote.list(params), loteInstanceTotal: Lote.count()]
    }

    def create = {
        def loteInstance = new Lote()
        loteInstance.properties = params
        return [loteInstance: loteInstance]
    }

    def save = {
        def loteInstance = new Lote(params)
        if (loteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'lote.label', default: 'Lote'), loteInstance.id])}"
            redirect(action: "show", id: loteInstance.id)
        }
        else {
            render(view: "create", model: [loteInstance: loteInstance])
        }
    }

    def show = {
        def loteInstance = Lote.get(params.id)
        if (!loteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lote.label', default: 'Lote'), params.id])}"
            redirect(action: "list")
        }
        else {
            [loteInstance: loteInstance]
        }
    }

    def edit = {
        def loteInstance = Lote.get(params.id)
        if (!loteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lote.label', default: 'Lote'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [loteInstance: loteInstance]
        }
    }

    def update = {
        def loteInstance = Lote.get(params.id)
        if (loteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (loteInstance.version > version) {
                    
                    loteInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'lote.label', default: 'Lote')] as Object[], "Another user has updated this Lote while you were editing")
                    render(view: "edit", model: [loteInstance: loteInstance])
                    return
                }
            }
            loteInstance.properties = params
            if (!loteInstance.hasErrors() && loteInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'lote.label', default: 'Lote'), loteInstance.id])}"
                redirect(action: "show", id: loteInstance.id)
            }
            else {
                render(view: "edit", model: [loteInstance: loteInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lote.label', default: 'Lote'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def loteInstance = Lote.get(params.id)
        if (loteInstance) {
            try {
                loteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'lote.label', default: 'Lote'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'lote.label', default: 'Lote'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lote.label', default: 'Lote'), params.id])}"
            redirect(action: "list")
        }
    }
}
