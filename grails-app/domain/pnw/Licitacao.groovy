package pnw

class Licitacao {

	static hasMany = [tags:String,propostas:Proposta,lotes:Lote]
	static belongsTo = [user:User]
	String edital
	Categoria categoria
	
    static constraints = {
    	tags(maxSize: Constants.MAX_TAG_NUMBER)
    	lotes(nullable:true)
    	edital(blank:false)
    }
}
