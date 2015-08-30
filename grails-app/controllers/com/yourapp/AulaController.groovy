package com.yourapp


import grails.converters.*

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import com.yourapp.AvaliacaoService

@Transactional(readOnly = true)
class AulaController {

    
    def springSecurityService
    def aulaService
    def avaliacaoService
    
     static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    
    def ajaxGetCategoriasPorArea = {	                                    
          render aulaService.getCategoriasByArea(params) 
    }

    
    def index() {        
        
        params.max = params.max!=null?new Integer(params.max):3
        params.offset= params.offset!=null?new Integer(params.offset):0
        
        def aulasList = aulaService.getAulasByUserId(params,springSecurityService.principal.id);                            
        respond aulasList , model:[aulaInstanceCount: aulasList.size]
    }
    
    
    def show(Aula aulaInstance) {        
        def userPrincipalId=springSecurityService.isLoggedIn()?springSecurityService.principal.id:null        
        render(view: "show", model: [aulaInstance: aulaInstance, userPrincipalId: userPrincipalId])        
    }

    def create() {                                      
        respond aulaService.getAulaInstanceByUser(springSecurityService.principal.id,params)
    }
    
    def edit(Aula aulaInstance) {        
        def userPrincipalId=springSecurityService.isLoggedIn()?springSecurityService.principal.id:null        
        render(view: "edit", model: [aulaInstance: aulaInstance, userPrincipalId: userPrincipalId])        
    }
    
    
    @Transactional
    def save(Aula aulaInstance) {
        
               
        if (aulaInstance == null) {
            notFound()
            return
        }
        
        //setar a disciplina para o usuario logado               
        aulaInstance.usuarioProfessor=User.get(springSecurityService.principal.id) 

        if (aulaInstance.hasErrors()) {
            respond aulaInstance.errors, view:'create'
            return
        }

       
        aulaInstance.save flush:true                
        aulaInstance.usuarioProfessor.valorMedioHoraAula=aulaService.getMediaHoraAulaUsuario(aulaInstance.usuarioProfessor.id);         
        aulaInstance.usuarioProfessor.save flush:true
        
        

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'aula.label', default: 'Aula'), aulaInstance.id])
                redirect aulaInstance
            }
            '*' { respond aulaInstance, [status: CREATED] }
        }
    }

    @Transactional
    def update(Aula aulaInstance) {
        
        
        if (aulaInstance == null) {
            notFound()
            return
        }
        
        
        if(aulaInstance.usuarioProfessor.id!=springSecurityService.principal.id){
            respond aulaInstance.errors, view:'edit'
            return
        }
        
        aulaInstance.usuarioProfessor=User.get(springSecurityService.principal.id)
        
        
        if (aulaInstance.hasErrors()) {
            respond aulaInstance.errors, view:'edit'
            return
        }

        
        aulaInstance.save flush:true                
        aulaInstance.usuarioProfessor.valorMedioHoraAula=aulaService.getMediaHoraAulaUsuario(aulaInstance.usuarioProfessor.id);         
        aulaInstance.usuarioProfessor.save flush:true
        
        
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Aula.label', default: 'Aula'), aulaInstance.id])
                redirect aulaInstance
            }
            '*'{ respond aulaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Aula aulaInstance) {

        if (aulaInstance == null) {
            notFound()
            return
        }

        def aulaBd = Aula.get(aulaInstance.id)
        
        if(aulaBd.usuarioProfessor.id!=springSecurityService.principal.id){           
            redirect action: "index";            
        }else{                        
            
            aulaInstance.delete flush:true
            def usuario = User.get(springSecurityService.principal.id)        
            usuario.valorMedioHoraAula=aulaService.getMediaHoraAulaUsuario(usuario.id);         
            usuario.save flush:true
           
            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.deleted.message', args: [message(code: 'Aula.label', default: 'Aula'), aulaInstance.id])
                    redirect action:"index", method:"GET"
                }
            '*'{ render status: NO_CONTENT }
            }                        
        }                
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'aula.label', default: 'Aula'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    
    //metodo responsavel por selecionar aula disciplina de professor para ser avaliada        
    def aulaEdit() {                    
       
        def idUserLogado = springSecurityService.principal.id;
        def idAula = params.id;
        def avaliacao = avaliacaoService.getAvaliacaoByUserAula(idUserLogado,idAula)          
        if(aulaService.aulaAvaliadaIsOfUser(avaliacao, idUserLogado)){           
            render(view: "show", model: [aulaInstance: avaliacao.aula, userPrincipalId: avaliacao.usuarioAluno.id])
        }
        
        def message = (avaliacao.nota!=0)?"Aula de professor avaliada com sucesso com nota: ${avaliacao.nota}!":null                 
        return [aulaInstance:avaliacao.aula, notaDisciplina:avaliacao.nota, message:message]    
    }
    
}
