package com.yourapp

import  com.yourapp.User
import  com.yourapp.Nivel

class Formacao {

    Integer anoInicio
    Integer anoTermino
    String curso
    String instituicao
    
    //User usuario
    //Nivel nivel
    
    static belongsTo = [ usuario : User, nivel : Nivel ] 
    
    static constraints = {        
          anoInicio(nullable:false,blank:false,range: 1950..2100)
          anoTermino(nullable:false,blank:false,range: 1950..2100)
          curso(nullable:false,blank:false)
          instituicao(nullable:false,blank:false)
    }
}
