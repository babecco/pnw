package pnw

class PessoaJuridica extends User{

	String cnpj
	String razaoSocial

    static constraints = {
		cnpj(blank:false,unique:true)
		razaoSocial(blank:false)
    }
}
