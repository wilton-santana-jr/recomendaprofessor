package com.yourapp

import com.yourapp.User
import com.yourapp.Aula

class Avaliacao implements Serializable {
        
    Integer nota //de 1..5
    String comentario
    
    //User usuarioAluno
    //Aula aula
    
    static belongsTo = [ usuarioAluno : User, aula : Aula ] 
    
    
    static constraints = {           
           nota(blank:false,nullable:false,range: 1..5)
           comentario(blank:true,nullable:true,maxSize: 1000)
           
           usuarioAluno(nullable:false, unique:['aula'])
           aula(nullable:false, unique:['usuarioAluno'])
           
    }
    
    
    static mapping = {
		//id composite: ['usuarioAluno', 'aula']
		version false         
                comentario type:'text'                                                
    }
    
    
}
