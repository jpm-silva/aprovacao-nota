# Aprovação de Notas
Pequeno sistema para pesquisa e aprovação de notas de compra.

Tecnologias utilizadas:
- FoxPro 9.0
- MySQL 5.7

Regras do sistema:
- Há uma tabela de configuração que determina as faixas de valores e a quantidade de vistos e aprovações necessários para aprovação da nota de compra.
- Usuários do sistema desempenham um papel específico: visto ou aprovação.
- Usuários do sistema podem registrar apenas um único visto ou aprovação por nota de compra.
- As aprovações somente ocorrem quando a quantidade de vistos necessários foi atingida.
- A nota de compra muda de status para aprovada quando atinge a quantidade de vistos e aprovações necessárias.
- A tela de pesquisa/aprovação lista somente as notas que:
  - Estão dentro do limite de valores configurados para o usuário;
  - Estão aguardando visto ou aprovação conforme o papel do usuário. Por exemplo, notas aguardando visto não são listadas para usuários com papel de aprovação;
  - Usuário ainda não registrou visto ou aprovação na nota.

Por conveniência, a configuração das faixas de valores, as notas e os usuários foram inseridos diretamente pelo banco de dados.

Pré-requisitos para execução do sistema:
- MySQL 5.7
- MySQL Connector/ODBC (5.2 ou 5.3) 32 bits
  
https://dev.mysql.com/get/Downloads/MySQLInstaller/mysql-installer-web-community-8.0.31.0.msi
  
Passos para execução do aplicativo:
1. Restaurar o dump do banco de dados localizado na pasta script do projeto.
2. Configurar a conexão com o banco de dados no arquivo "aprovacaonota.ini". Se atentar para configurar o número da versão do driver corretamente.
  
Para execução do projeto:
- Existe um programa chamado paths.prg que configura os caminhos dos arquivos, basta alterar o caminho principal configurando com a localização atual do projeto e executá-lo.
  
Observações:
- Existem 8 usuários pré-cadastrados: João, Patrícia, Ruan, Jaqueline, Nicolas, Nathan, Alexandre e Maria.
- As senhas de todos os usuários são "1".
