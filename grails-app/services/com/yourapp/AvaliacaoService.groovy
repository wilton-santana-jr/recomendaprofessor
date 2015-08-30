package com.yourapp

import grails.transaction.Transactional

@Transactional
class AvaliacaoService {

    
    
    @Transactional(readOnly = true)
    def Avaliacao getAvaliacaoByUserAula(idUser,idAula){
                
        //carregar usuario logado e carregar a nota da disciplina se existir
        def userInstance = User.get(idUser);
        
        def aulaInstance = Aula.findById(idAula)                              
        
        def avaliacaoInstance =  Avaliacao.findByUsuarioAlunoAndAula(userInstance,aulaInstance) 
        
        if(avaliacaoInstance==null){        
            avaliacaoInstance = new Avaliacao(usuarioAluno: userInstance, aula: aulaInstance, nota:0,comentario:null);
        }
        
        return avaliacaoInstance
    }
    
    
    @Transactional(readOnly = true)
    def Integer getScoreAvaliativoByUserAula(notaDisciplina){
                
        def nota = Integer.parseInt(notaDisciplina?:'0');        
        if(nota!=1 && nota!=2 && nota!=3 && nota!=4 && nota!=5){            
            nota = 1;
        }    
        return nota
    }
    
}
