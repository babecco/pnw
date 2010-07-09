package pnw

class Proposta {

	static belongsTo = [licitacao:Licitacao,user:User]
	Lote lote

    static constraints = {
    }
}
