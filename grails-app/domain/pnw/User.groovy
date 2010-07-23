package pnw

class User {

    String username
    String email
    String senha

    static constraints = {
      username(nullable:false,blank:false,unique:true)
      senha(nullable:false, blank:false)
      email(blank:false,email:true,unique:true)
    }
}
