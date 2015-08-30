package com.yourapp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AvaliacaoController {

    def springSecurityService
    def avaliacaoService          
    
    ////////////////////// metodos responsáveis por avaliar disciplina de um determinado professor    
    @Transactional
    def avaliaAula(Avaliacao avaliacaoInstance) {
        
        def idUserLogado = springSecurityService.principal.id;      
        def idAulaAvaliada = params.id;                
        def avaliacao = avaliacaoService.getAvaliacaoByUserAula(idUserLogado,idAulaAvaliada);                
        avaliacao.nota = avaliacaoService.getScoreAvaliativoByUserAula(params.notaDisciplina);                
        
        avaliacao.save(flush:true)                        
                    
        redirect(controller: "aula", action: "aulaEdit", id: idAulaAvaliada, params: [notaDisciplina: avaliacao.nota, status: OK])
        
    }
        
    
}
