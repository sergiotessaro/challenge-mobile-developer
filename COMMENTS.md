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
