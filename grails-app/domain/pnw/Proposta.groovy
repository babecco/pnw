package pnw

class Proposta {

	Date dateCreated

	static belongsTo = [lote:Lote,user:User]
	boolean primeiraFase = true
	double lance

    static constraints = {
//			lance(min:(0.0)) - dando problemas :p
    }
}
