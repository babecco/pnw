package pnw

class Lote {
	
	static hasMany = [itens:Item]
	static belongsTo = Licitacao

    static constraints = {
    }
}
