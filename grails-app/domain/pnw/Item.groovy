package pnw

class Item {

	static hasMany = [especificacoes : Especificacao]
	int quantidade
	String descricao
	double preco

    static constraints = {
    }
}
