package pnw

class LogicService {

	static transactional = true

	def crudService

	//caso o usuario mande varios lances, pegamos apenas o mais recente	
	def mandarLanceInicial(User user, Lote lote,double lance) {
		def licitacao = lote.licitacao
		def today = new Date()
		def proposta
		if(today > licitacao.fimPrimeiraFase) {
			proposta = new Proposta(user:user,lote:lote,lance:lance) //TODO do this properly
			proposta.errors.reject("primeiraFase.encerrada")
		} else			
			proposta = crudService.createProposta(user,lote,lance,true)	

		return proposta
	}

}
