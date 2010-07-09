package pnw

class Item {

	static hasMany = [especificacoes : Especificacao]
	int quantidade
	String descricao
	double preco

    static constraints = {
    	quantidade(min:1)
    	descricao(blank:false)
    	preco(min:0)
    }
}
