package pnw

class User {

    String username
    String email

    static constraints = {
      name(nullable:false,blank:false)
      email(blank:false,email:true)
    }
}
