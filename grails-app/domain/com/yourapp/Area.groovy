package com.yourapp

import  com.yourapp.Categoria

class Area {

    String nome
    
    
    static hasMany = [ categorias : Categoria ]
    
    String toString(){
        nome
    }
    
    static constraints = {
        nome(nullable:false,blank:false,unique:true,inList:["Exatas", "Humanas", "Biológicas", "Idiomas", "Artes&Etc"])
    }
    
    
    static mapping = {
         //sort "nome"  
         sort nome: "asc"
    }
    
}
