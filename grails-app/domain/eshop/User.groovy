package eshop

class User {
    String userName;
    String password;
    String role;
    String email;

    static constraints = {

            userName(blank: false,nullable: false, minSize: 3)
            password(blank: false,nullable: false,minSize: 3)
            role(inList: ['Admin','User','App'],blank: false,nullable: false)
            email(email:true,blank: false )


    }
}
