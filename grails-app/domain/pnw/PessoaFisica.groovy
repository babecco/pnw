package pnw

class PessoaFisica extends User {

	String cpf
	String name	

    static constraints = {
		name(blank:false)
		cpf(blank:false)
    }
}
