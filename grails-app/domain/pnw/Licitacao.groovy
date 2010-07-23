package pnw

class Licitacao {

	//propriedades automaticamente gerenciadas pelo hibernate
	Date dateCreated
	Date lastModified

	static hasMany = [tags:String,propostas:Proposta,lotes:Lote]
	static belongsTo = [user:User]
	String edital
	Categoria categoria
	Date fimPrimeiraFase
	
    static constraints = {
    	tags(maxSize: Constants.MAX_TAG_NUMBER)
    	lotes(nullable:true)
    	propostas(nullable:true)
    	edital(blank:false)
    }
}
