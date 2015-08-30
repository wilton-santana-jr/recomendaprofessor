package com.yourapp

 import grails.plugin.springsecurity.annotation.Secured

import com.yourapp.FileUploadService
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {
     
    def userService     
    def fileUploadService          
    def springSecurityService     
    def mailService


    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]
    
    
    def register() {
        respond new User(params)
    }
    
    
    @Transactional
    def confirm(String id)
    {

        User userInstance= User.findByConfirmCode(id)
        if(!userInstance)
        {
            return;
        }

        userInstance.confirmCode='';
        userInstance.enabled=true;
        
        if (!userInstance.save(flush: true)) {
            render(view: "success", model: [message: 'Problema durante a ativação da conta.'])
            return
        }
        render(view: "success", model: [message: 'Sua conta está ativada. Você ja pode fazer login no sistema.'])
    }
      
            
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {        
        def userPrincipalId=springSecurityService.isLoggedIn()?springSecurityService.principal.id:null        
        render(view: "show", model: [userInstance: userInstance, userPrincipalId: userPrincipalId])        
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }


        userInstance.enabled=false;
        userInstance.passwordExpired=false;
        userInstance.accountLocked=false;
        userInstance.accountExpired=false;        
        userInstance.valorMedioHoraAula=new BigDecimal("0.0"); 
        
        
        userInstance.confirmCode=UUID.randomUUID().toString()
        
        if (userInstance.hasErrors()) {
            
            println userInstance.enderecoCidade.nome
            
            respond userInstance, view:'register'
           //  render userInstance.errors, view:'register'
            return
        }

        if(userInstance.save(flush:true)){
            
            //enviar email para usuario desbloquear conta                                   
            mailService.sendMail {
                to userInstance.email
                subject "Recomenda Reforço - Confirmação de Conta de Usuário"
                html g.render(template:"mailTemplate",model:[code:userInstance.confirmCode])
            }
            
            // Save Avatar if uploaded
            def avatarImage = request.getFile('photo')
            if (!avatarImage.isEmpty()) {
                userInstance.avatar = fileUploadService.uploadFile(avatarImage, "${userInstance.id}.png", "avatarImages")
            }

          
        }          
        
        render(view: "success", model: [message: 'Sua conta foi criada. Por favor ative a sua conta no seu endereço de email.Um link de confirmação de sua conta foi enviado para o seu email.'])

    }

    def edit(User userInstance) {
        respond userInstance
    }
    
    def editaPerfil() {
        User userInstance = User.get(springSecurityService.principal.id)
        respond userInstance
    }
    
    
    
    
    @Transactional
    def updatePerfil(User userInstance) {
        
            
        
        def userLogado = User.get(springSecurityService.principal.id)
        
         userInstance.valorMedioHoraAula //campo calculado
        
         def mediaHoraAulaProfessorInstance =  Aula.executeQuery("select TRUNC(avg(a.valorHoraAula),2) from Aula a \n\
                                                     where a.usuarioProfessor.id = :idProfessor",[idProfessor:userInstance.id]);
         
                       
        userInstance.valorMedioHoraAula=new BigDecimal("0.0");        
        for(Object media:mediaHoraAulaProfessorInstance){ 
            if(media!=null)
                userInstance.valorMedioHoraAula=new BigDecimal(media);
         }
        
        
        if(userInstance.password==null||userInstance.password.isEmpty())
            userInstance.password=userLogado.password;     
            
        def estadoInstance=userInstance.enderecoCidade.estado 
        
        userInstance.id=userLogado.id
        userInstance.username=userLogado.username
        userInstance.email=userLogado.email
        
        userInstance.accountExpired=false
        userInstance.accountLocked=false
        userInstance.enabled=true
        userInstance.passwordExpired=false
        
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
             respond userInstance.errors, view:'editaPerfil'
            return
        }

        
        if(userInstance.save(flush:true)){            
            // Save Avatar if uploaded
            def avatarImage = request.getFile('photo')
            if (!avatarImage.isEmpty()) {
                userInstance.avatar = fileUploadService.uploadFile(avatarImage, "${userInstance.id}.png", "avatarImages")
            }
        }

        request.withFormat {
            form multipartForm {
                  flash.message = message(code: 'Perfil do usuário atualizado com sucesso!', args: [message(code: 'User.perfil.show', default: 'Perfil do usuário atualizado com sucesso!'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
                        
    }
    
    
    def ajaxGetCidadesPorEstado = {
                
         //render cidadeService.getCidadesByEstado(params) 
        
        def cidades = Cidade.findAll("from Cidade as c where c.estado.id=:idCidade order by c.nome asc", [idCidade: new Long(params.id)]) 
                    
        String strHtmlCidades = "";
        for(Cidade cidade: cidades){              
            def selecionavel = (new Long(params.idCidadeSelected)==new Long(cidade.id))?" selected ":" ";
            strHtmlCidades=strHtmlCidades+"<option value=\""+cidade.id+"\" "+selecionavel+"  >"+cidade.nome+"</option>";        
        }
                
         render strHtmlCidades
        
    }
   

    @Transactional
    def update(User userInstance) {
        
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        
        
        if(userInstance.save(flush:true)){            
            // Save Avatar if uploaded
            def avatarImage = request.getFile('photo')
            if (!avatarImage.isEmpty()) {
                userInstance.avatar = fileUploadService.uploadFile(avatarImage, "${userInstance.id}.png", "avatarImages")
            }
            
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
        
        
    }

    @Transactional
    @Secured(['ROLE_ADMIN']) //somente usuarios administradores poderão excluir usuários
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
