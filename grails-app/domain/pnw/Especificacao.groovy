package pnw

class Especificacao {

	String key
	String value
	
    static constraints = {
    	key(blank:false)
    	value(blank:false)
    }
}
