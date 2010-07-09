package pnw

class Lote {
	
	static hasMany = [itens:Item]
	static belongsTo = [licitacao:Licitacao]

    static constraints = {
    	itens(minSize:1)
    	licitacao(nullable:true)
    }
}
