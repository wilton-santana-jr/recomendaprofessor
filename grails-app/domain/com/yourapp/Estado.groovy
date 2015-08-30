package com.yourapp


import  com.yourapp.Cidade

class Estado {
    
    String nome
    String sigla
    
                    
    static hasMany = [ cidades : Cidade ]
    
    String toString(){
       return "${nome} - ${sigla}"
    }
    
    
    static constraints = {
              nome(nullable:false,blank:false,unique:true,inList:["Acre","Alagoas","Amapá","Amazonas","Bahia","Ceará","Distrito Federal",\
                                                    "Espírito Santo","Goiás","Maranhão","Mato Grosso","Mato Grosso do Sul","Minas Gerais","Pará","Paraíba","Paraná",\
                                                    "Pernambuco","Piauí","Rio de Janeiro","Rio Grande do Norte","Rio Grande do Sul","Rondônia","Roraima","Santa Catarina",\
                                                    "São Paulo","Sergipe","Tocantins"])
              sigla(nullable:false,blank:false,unique:true,inList:["AC", "AL", "AP", "AM", "BA","CE","DF","ES","GO","MA","MT",\
                                                    "MS","MG","PA","PB","PR","PE","PI","RJ","RN","RS","RO","RR",\
                                                    "SC","SP","SE","TO"])
 

    }
    
    static mapping = {
        sort nome: "asc"
    }
}
