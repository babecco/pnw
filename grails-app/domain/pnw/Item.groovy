package pnw

class Item {

	static hasMany = [especificacoes : Especificacao]
	int quantidade
	String descricao
	double precoMinimo

    static constraints = {
    	quantidade(min:1)
    	descricao(blank:false)
 //    	precoMinimo(min:(0.0)) dando problemas
    }
}
