package com.yourapp

class Proposito {

    String nome
    
    String toString(){
       return nome
    }
    static constraints = {
        nome(nullable:false,blank:false,unique:true,inList:["Reforço Escolar", "Idiomas", "Profissionalizante", "Concurso", "Lazer e Artes"])
    }
    
    static mapping = {
        sort id: "asc"
    }
}
