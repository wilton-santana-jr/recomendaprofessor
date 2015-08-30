package com.yourapp

class Nivel {
    
    String nome

     String toString(){
       return nome
    }
    
    static constraints = {
        nome(nullable:false,blank:false,unique:true,inList:["Ensino Fundamental", "Ensino Médio", "Pré-Vestibular", "Ensino Superior"])
    }
    
    static mapping = {
        sort id: "asc"
        
        
    }
}
