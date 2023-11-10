#### Decisão de arquitetura

- Utilizado Clean Architecture por ser uma arquitetura sólida, de fácil manutenção e organização robusta, apesar de não ser a mais ideal para aplicativos de menor complexidade, fiz pensando em uma possível escalonabilidade do projeto, além de que o app fica desacoplado e deixa mais fácil testá-lo.
- Foram utilizados alguns principios do **SOLID** nos exemplos abaixo:
    - S: Responsabilidade única, por exemplo, a classe de LoginDatasource, ela é responsável apenas pelas funções de login do app.
    - O: Aberto/Fechado, utilizando do mesmo exemplo, a interface de LoginDatasource está aberta a extensões sem ter que refatorar a classe, assim deixando-a fechada para modificações.
    - I: Segregar as interfaces, fazendo com que cada uma seja responsável por uma parte do processo de login.
-Gerenciamento de Estado:
    - Utilizado o MobX por ser um gerenciamento de estado simples de implementar e performático para aplicativos menores.

#### Lista de bibliotecas utilizadas e suas respectivas versões

    -mobx: ^2.2.1
    -dio: ^5.3.3
    -flutter_mobx: ^2.1.0+1
    -mobx_codegen: ^2.4.0
    -dartz: ^0.10.1
    -cupertino_icons: ^1.0.2
    -flutter_modular: ^6.3.2
    -equatable: ^2.0.5
    -mocktail: ^0.3.0
    -build_runner: ^2.0.5
    -shared_preferences: ^2.2.2
    -brasil_fields: ^1.14.0

#### O que melhoraria se tivesse mais tempo

- Faria todos os testes unitários, deixei alguns de lado por achar que não ia entregar no prazo.
- Tratamento de erros.
- Diminuiria a repetição de código.
- Componentização de widgets que foram muito utilizados
- Utilização de criptografia na persistência de dados.
- Criar uma branch develop para seguir o Gitflow mais rigorosamente.
- Melhorar qualidade dos commits.
- Adicionar um tratamento de tamanho aos componentes conforme resolução e tamanho de tela.


#### Requisitos obrigatórios

- Todos entregues
- A visualização fica melhor na tela do emulador do Pixel 5, por não haver tratamento de tamanhos dinâmico.

#### Observação

- O apk e aab assinados estão disponíveis na pastas apk_app_folder.
