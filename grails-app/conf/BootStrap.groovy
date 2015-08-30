
import com.yourapp.Role
import com.yourapp.User
import com.yourapp.UserRole
import com.yourapp.Estado
import com.yourapp.Cidade

class BootStrap {

   def init = { servletContext ->
//        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
//        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
//
//    
//        def testEstadoPI = new Estado(nome: 'Piauí' , sigla: 'PI'  )
//         testEstadoPI.save(flush: true)
//                 
//        def testCidadeTeresinaPI = new Cidade(nome: 'Teresina' , estado: testEstadoPI  )        
//        testCidadeTeresinaPI.save(flush: true)
//        
//        
//        def testUser = new User(username: 'admin', 
//                                enabled: true, 
//                                password: 'admin', 
//                                
//                                enderecoCidade: testCidadeTeresinaPI,        
//                                email:'wsantana3@gmail.com',
//                                nome:'Wilton',
//                                sobreNome:'Moreira de Santana Júnior',
//                                cpf:'012.104.493-90',                              
//                                genero:'Masculino',
//                                enderecoCep:'64023-224',
//                                enderecoLogradouro:'Quadra 22, bloco 03 aptº 204',
//                                enderecoNumero:'204',
//                                enderecoComplemento:'Próximo ao Salute',
//                                enderecoBairro:'Morada nova 2',
//                                dataNascimento: new Date(),
//                                valorMedioHoraAula: 50.00)
//        
//        //////def testUser = new User(username: 'admin', enabled: true, password: 'admin')
//        
//        
//        testUser.save(flush: true)
//
//        UserRole.create testUser, adminRole, true
//
//        assert User.count() == 1
//        assert Role.count() == 2
//        assert UserRole.count() == 1
  }
  
  def destroy = {
  }
}
