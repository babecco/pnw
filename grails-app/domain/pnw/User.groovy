package pnw

class User {

    String username
    String email

    static constraints = {
      username(nullable:false,blank:false,unique:true)
      email(blank:false,email:true,unique:true)
    }
}
