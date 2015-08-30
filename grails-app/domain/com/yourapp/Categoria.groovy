package com.yourapp

import  com.yourapp.Area

class Categoria {
    
    String nome
    
    //Area area
    
    static belongsTo = [ area : Area] 
    
     String toString(){
        nome
    }

    static constraints = {
              nome(nullable:false,blank:false,inList:["Matemática","Física","Química","Biologia","Computação","Administração","Arquitetura","Artes Plásticas","Ciências Contábeis","Economia","Ciências Sociais","Design","Direito","Educação Física","Enfermagem","Engenharia","Farmácia-Bioquímica","Filosofia","Fisioterapia","Fonoaudiologia","Geografia","História","Jornalismo","Letras","Medicina","Veterinária","Música","Nutrição","Odontologia","Pedagogia","Psicologia","Terapia Ocupacional","Zootecnia","Português","Inglês","Italiano","Francês","Chinês","Espanhol","Alemão","Russo","Teatro","Dança","Arte Digital","Desenho","Fotografia","Pintura","Mágica / Ilusionismo","Japonês","Latim","Estatística","Libras","Esportes","Gastronomia / Culinária","Árabe","Hebraico","Português para estrangeiros","Outros idiomas","Informática","Matemática Financeira","Cálculo","Marketing","Sociologia","Literatura","Redação","Exatas [Outras]","Ciências da Terra","Humanas [Outras]","Biológicas [Outras]","Outros","Grego","Coreano"])      
              area(nullable:false)
    }
    
    static mapping = {
        //sort "nome"
        sort nome: "asc"
    }
    
}
