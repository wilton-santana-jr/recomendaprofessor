package com.yourapp

import grails.transaction.Transactional

@Transactional
class ProfessorService {

    @Transactional(readOnly = true)
    def getAulasOfertadasPelosProfessores(String termoBusca, params){
        
        
        

        
    
        
        if(termoBusca==null)
            termoBusca=''
            
        
        def aulaInstanceList =  Aula.executeQuery("select a.id  ,a.version ,a.categoria.nome ,a.especialidade , a.exibirValorHoraAula, \n\
                                                a.nivelEscolar.nome,a.proposito.nome, a.usuarioProfessor.id,a.usuarioProfessor.nome,a.usuarioProfessor.email, a.valorHoraAula \n\
                                                    , avg(av.nota) as media , count(av.nota) as qtd, a.usuarioProfessor.enderecoCidade.nome, a.usuarioProfessor.enderecoCidade.estado.nome, a.usuarioProfessor.enderecoCidade.estado.sigla, a.usuarioProfessor.avatar, a.usuarioProfessor.genero from \n\
                                                    Aula a left outer join a.avaliacoes as av where  \n\
( upper(a.especialidade) like upper(:termoBusca) \n\
 or upper(a.categoria.nome) like upper(:termoBusca) \n\
or upper(a.nivelEscolar.nome) like upper(:termoBusca) \n\
or upper(a.proposito.nome) like upper(:termoBusca) \n\
or upper(a.usuarioProfessor.nome) like upper(:termoBusca) \n\
or upper(a.usuarioProfessor.email) like upper(:termoBusca) \n\
or upper(a.usuarioProfessor.enderecoCidade.nome) like upper(:termoBusca)\n\
or upper(a.usuarioProfessor.enderecoCidade.estado.nome) like upper(:termoBusca) \n\
or upper(a.usuarioProfessor.enderecoCidade.estado.sigla) like upper(:termoBusca) \n\
) group by \n\
    a.id,a.version,a.categoria.nome,a.especialidade, a.exibirValorHoraAula,a.nivelEscolar.nome,a.proposito.nome,a.usuarioProfessor.id,a.usuarioProfessor.nome,a.usuarioProfessor.email,a.valorHoraAula, a.usuarioProfessor.enderecoCidade.nome, a.usuarioProfessor.enderecoCidade.estado.nome, a.usuarioProfessor.enderecoCidade.estado.sigla, a.usuarioProfessor.avatar, a.usuarioProfessor.genero  \n\
 order by count(av.nota) desc, avg(av.nota) desc", 
       [termoBusca:"%${termoBusca}%"] 
                      ,[max: params.max,offset:params.offset]);
        
        
        return aulaInstanceList
    }
    
    
     @Transactional(readOnly = true)
    def getAulasOfertadasPelosProfessores(termoBusca){
        
             
        if(termoBusca==null)
            termoBusca=''
                    
        def count = Aula.executeQuery("select  count(av.nota) from \n\
                                                    Aula a left outer join a.avaliacoes as av where 1=1 \n\
 and ( upper(a.especialidade) like upper(:termoBusca) \n\
 or upper(a.categoria.nome) like upper(:termoBusca) \n\
or upper(a.nivelEscolar.nome) like upper(:termoBusca) \n\
or upper(a.proposito.nome) like upper(:termoBusca) \n\
or upper(a.usuarioProfessor.nome) like upper(:termoBusca) \n\
or upper(a.usuarioProfessor.email) like upper(:termoBusca) \n\
or upper(a.usuarioProfessor.enderecoCidade.nome) like upper(:termoBusca)\n\
or upper(a.usuarioProfessor.enderecoCidade.estado.nome) like upper(:termoBusca) \n\
or upper(a.usuarioProfessor.enderecoCidade.estado.sigla) like upper(:termoBusca) \n\
) group by \n\
    a.id,a.version,a.categoria.nome,a.especialidade, a.exibirValorHoraAula,a.nivelEscolar.nome,a.proposito.nome,a.usuarioProfessor.id,a.usuarioProfessor.nome,a.usuarioProfessor.email,a.valorHoraAula, a.usuarioProfessor.enderecoCidade.nome, a.usuarioProfessor.enderecoCidade.estado.nome, a.usuarioProfessor.enderecoCidade.estado.sigla,a.usuarioProfessor.avatar, a.usuarioProfessor.genero ", 
       [termoBusca:"%${termoBusca}%"]).size;
        
         return count
    }
    
        
   
    
}
