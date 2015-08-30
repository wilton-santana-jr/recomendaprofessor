package com.yourapp

class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username //email
	String password //senha
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
        
        String email
        String nome
        String sobreNome
        String cpf
        Date dataNascimento
        String genero
        String enderecoCep
        String enderecoLogradouro
        String enderecoNumero
        String enderecoComplemento
        String enderecoBairro
        String dddFone1
        String numFone1
        String dddFone2
        String numFone2
        
        String confirmCode
        
        
        byte[] photo 
        String avatar
        
        BigDecimal valorMedioHoraAula 
        
        //Cidade enderecoCidade
        
        static hasMany = [ aulas : Aula, formacoes : Formacao, avaliacoes : Avaliacao ]
        
        static belongsTo = [ enderecoCidade : Cidade ] 

	User(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	@Override
	int hashCode() {
		username?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof User && other.username == username)
	}

	@Override
	String toString() {
		username
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
               
                
                email(blank:false,nullable:false,email:true,unique:true)
                nome(blank:false,nullable:false)
                sobreNome(blank:false,nullable:false)
                cpf(blank:false,nullable:false,cpf:true)
                dataNascimento(blank:false,nullable:false)
                genero(blank: false,inList:["Masculino", "Feminino"])
                enderecoCep(blank:false,nullable:false,cep:true)
                enderecoLogradouro(blank:false,nullable:false,maxSize: 1000)
                enderecoNumero(blank:false,nullable:false)
                enderecoComplemento(blank:true,nullable:true,maxSize: 1000)
                enderecoBairro(blank:false,nullable:false)
                dddFone1(blank:true,nullable:true)
                numFone1(blank:true,nullable:true)
                dddFone2(blank:true,nullable:true)
                numFone2(blank:true,nullable:true)

                photo (nullable:true,maxSize: 1024 * 1024 * 15)
                avatar(nullable:true)
                
                valorMedioHoraAula (scale:2,blank:false,nullable:false)
                enderecoCidade(nullable:false)
        
                confirmCode(nullable:true)
        
        
	}

	static mapping = {
		password column: '`password`'                                
                table name:'user_securedapp'
                photo column: 'photo', type:'image'
	}
            
}
