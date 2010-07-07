package pnw

class Proposta {

	static belongsTo = [Licitacao,User]
	Lote lote

    static constraints = {
    }
}
