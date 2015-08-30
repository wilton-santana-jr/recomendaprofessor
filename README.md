RecomendaReforço.net
==========

[RecomendaReforco.net](RecomendaReforco.net) é uma aplicação que construímos para recomendar professores de aula de reforço com base na disciplina lecionada
pelo professor [Foi usado Grovvv On Grails](http://200.137.175.6:8080/recomendaprofessor/professor/index)!

Essa versão do código é para o Grails 2.4.5 [grails-2.4.5]
(https://github.com/wiltonmoreirajr/recomendaprofessor).

Licença
=======
O [recomendareforco.net](RecomendaReforco.net) é distribuído sob a licença MIT:

www.opensource.org/licenses/MIT

Pra sucesso na instalação seguir os seguintes passos:

- Para a instalação da app você deverá configurar sua conta de email do gmail colocando o email e senha no arquivo: grails-app/conf/Config.groovy na parte de configuração de email
- Para rodar a aplicação com sucesso voce deverá instalar o postgres com senha padrão postgres e rodar na porta 5432
- Em seguida crie um banco de dados chamado: secureapp usando o cliente sql por exemplo: pgadmin
- No terceiro passo você deve rodar a aplicação para isso você deve ter instalado o grails 2.4.5 e rodar a aplicação com o comando run-app do grails
- Feito isso o grails irá gerar toda a estrutura do banco de dados usado na aplicação no database: secureapp
- Apartir deste ponto você deve rodar o script de instalação dos dados básicos da aplicação para isso rode o script sql que encontra-se no diretório:grails-app\conf
- O script chama-se: inserts sql apos o banco ser gerado no grails.sql rode o mesmo no postgres para serem feitas as devidas inserções no banco de dados
- Após esse comando rode a aplicação grails novamente e veja os dados cadastrados
- Para acessar o sistema e avaliar e recomendar professores você poderá criar uma conta para você ou então usar as contas criadas com a senha padrão: 12345678 e o login é o email da pessoa.


# recomendaprofessor

É um Projeto final da disciplina de programação web do mestrado profissional em computação da UFPE desenvolvido em grails 2.4.5