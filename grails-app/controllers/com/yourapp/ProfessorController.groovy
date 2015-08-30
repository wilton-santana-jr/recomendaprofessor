package com.yourapp


import grails.converters.*

import grails.plugin.springsecurity.annotation.Secured
 
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import com.yourapp.User

@Transactional(readOnly = true)
class ProfessorController {

    def springSecurityService
    def professorService
    
    def index(String termoBusca) {
        
        params.max = params.max!=null?new Integer(params.max):3
        params.offset= params.offset!=null?new Integer(params.offset):0
        
    
        
        def aulaInstanceList = professorService.getAulasOfertadasPelosProfessores(termoBusca,params);                        
        def count = professorService.getAulasOfertadasPelosProfessores(termoBusca);                      
        def userPrincipalId=springSecurityService.isLoggedIn()?springSecurityService.principal.id:null
                                            
        render( view: "index", model: [aulaInstanceList:aulaInstanceList,aulaInstanceCount:count, termoBusca: termoBusca, userPrincipalId: userPrincipalId])
                
    }    
    
    
    
}
