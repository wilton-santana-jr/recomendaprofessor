package com.yourapp

import com.yourapp.Estado

class Cidade {
    
    String nome
    //Estado estado
    
    
     /* Isso faz o relacionamento bidirecional*/
    static belongsTo = [ estado : Estado] 
    
     String toString(){
        nome
    }
    
    
    
    static constraints = {
              nome(nullable:false,blank:false)
              estado(nullable:false)
    }
    
    
    static mapping = {
        sort nome: "asc"
    }
}
