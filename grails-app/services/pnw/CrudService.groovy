package pnw

class CrudService {

    static transactional = true

	//returns [boolean status, User object, String message]
	def createUser(String name, String email) {
		def user = new User(username:name,email:email)
		def returnTuple = []
		if(!user.validate()) {
			returnTuple << false
			returnTuple << user
			returnTuple << "changeme" 
			log.info "deu merda"
		} else {
			if(user.save()) {
				returnTuple << true
				returnTuple << user
			} else {
				log.error "problema no banco!"
			}
		}
		return returnTuple
	}

    def createPessoaJuridica() {

    }
}
