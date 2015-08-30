package com.yourapp

import grails.transaction.Transactional
import  com.yourapp.Categoria

@Transactional
class AulaService {

    
    @Transactional(readOnly = true)    
    def String getCategoriasByArea(params){        
                      
        def categorias = Categoria.findAll("from Categoria as c where c.area.id=:idArea order by c.nome asc", [idArea: new Long(params.id)]) 
                    
        String strHtmlCategorias = "";
        for(Categoria cat: categorias){              
            def selecionavel = (new Long(params.idCategoriaSelected)==new Long(cat.id))?" selected ":" ";
            strHtmlCategorias=strHtmlCategorias+"<option value=\""+cat.id+"\" "+selecionavel+"  >"+cat.nome+"</option>";        
        }
                
        return strHtmlCategorias
    }
    
    @Transactional(readOnly = true)
    def List getAulasByUserId(params,idUser){
                        
        def aulasList = Aula.findAll("from Aula as a where a.usuarioProfessor.id=:usuarioProfessorId", 
            [usuarioProfessorId: idUser, max: params.max,offset:params.offset])
     
        return aulasList
    }
    

    def Aula getAulaInstanceByUser(idUser,paramsAula){
                
        def aulaInstance = new Aula(paramsAula)
        aulaInstance.usuarioProfessor=User.get(idUser)
            
        return aulaInstance
    }
    
    @Transactional(readOnly = true)
    def Avaliacao getAvaliacaoByUserAula(idUser,idAula){
                
        //carregar usuario logado e carregar a nota da disciplina se existir
        def userInstance = User.get(idUser);
        
        def aulaInstance = Aula.findById(idAula)                              
        
        def avaliacaoInstance =  Avaliacao.findByUsuarioAlunoAndAula(userInstance,aulaInstance) 
        
        if(avaliacaoInstance==null){        
            avaliacaoInstance = new Avaliacao(usuarioAluno: userInstance, aula: aulaInstance, nota:0);
        }
        
        return avaliacaoInstance
    }
    
    @Transactional(readOnly = true)
    def boolean aulaAvaliadaIsOfUser( avaliacao, idUser){
        return (avaliacao.usuarioAluno.id==idUser && avaliacao.aula.usuarioProfessor.id==idUser)
    }
    
    def BigDecimal getMediaHoraAulaUsuario(idUsuario){
        def mediaHoraAulaProfessorInstance =  Aula.executeQuery("select TRUNC(avg(a.valorHoraAula),2) from Aula a \n\
                                                     where a.usuarioProfessor.id = :idProfessor",[idProfessor:idUsuario]);                                
        def valorMedioHoraAula=new BigDecimal("0.0");        
        for(Object media:mediaHoraAulaProfessorInstance){              
            valorMedioHoraAula=(media!=null)?new BigDecimal(media):new BigDecimal("0.0");            
        }      
        return valorMedioHoraAula
    }
    
    
}
