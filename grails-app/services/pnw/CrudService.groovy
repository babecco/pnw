package pnw

class CrudService {

    static transactional = true

    def createPessoaJuridica(String username, String email, String cnpj, String razaoSocial) {
		def user = new PessoaJuridica(username:username,email:email,cnpj:cnpj,razaoSocial:razaoSocial)
		if(!user.save()) {
			log.info "Validation error - ${user.errors}"
		}
			return user
	}

	def createPessoaFisica(String username, String email, String cpf, String name) {
		def user = new PessoaFisica(username:username,email:email,cpf:cpf,name:name)
		if(!user.save()) {
			log.info "Validation error - ${user.errors}"
		}
			return user
	}
	
	def createItem(int quantidade, String descricao, double preco, especificacoes) {
		def specList = []
		def invalidSpec = []
		especificacoes.each { key, value ->
			def spec = new Especificacao(key:key,value:value)
			if(spec.save()) {
				specList << spec	
			} else {
				invalidSpec << spec
			}
		}
		
		def item = new Item(quantidade:quantidade,descricao:descricao,preco:preco,especificacoes:(specList as Set))
		
		if(!item.save()) {
			log.info "Validation error of item - ${item.errors}"
		}
		
		if(invalidSpec.size() > 0) {
			return [item,invalidSpec]
		} else 
			return item
	}
	
	def createLote(itens) {
		def lote = new Lote(itens:(itens as Set))
		if(!lote.save()) {
			log.info "Validation error on lote - ${lote}"
		}
		return lote
	}
	
	def createLicitacao(tags, lotes, user, edital, categoria){
		def tagList = []
		tags.each{ tag ->
			tag = tag.trim()
			if (tag && !tag.isEmpty()){
				tagList << tag
			}
		}
		
		def licitacao = new Licitacao(tags:(tags as Set), user:user, edital:edital, categoria:categoria)
		if(!licitacao.save()){
			log.info "Validation error on licitação - ${licitacao}"
		}
		return licitacao
	}
	
}
