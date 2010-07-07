package pnw

class Licitacao {

	static hasMany = [tags:String,propostas:Proposta,lotes:Lote]
	Categoria categoria
	
    static constraints = {
    }
}
