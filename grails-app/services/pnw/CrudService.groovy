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
}
