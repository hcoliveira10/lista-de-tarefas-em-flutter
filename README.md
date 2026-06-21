# lista-de-tarefas-em-flutter
ACQA (Avaliação Continuada de Questão Aberta) da matéria: DESENVOLVIMENTO PARA DISPOSITIVOS MÓVEIS

Descrição do projeto

O aplicativo foi desenvolvido em flutter / dart, ve é voltado para a organização pessoal e gerenciamento de tarefas.

Funcionalidades: O app tem uma tela inicial com um botão de login e outro de cadastro, ambos com campos para colocar usuário e senha;

Calendário: possibilita uma visualização por mês através do pacote table_calendar, permitindo a seleção de datas específicas para adicionar as tarefas;

Lista de tarefas: sistema que possibilita incluir tarefas, marcá-las como concluídas ou excluí-las, priorizando as tarefas pendentes deixando-as no topo. 

Navegação bidirecional: inclusão de botões manuais de retorno e encerramento de sessão para garantir a fluidez entre as telas.

Estrutura de arquivos (arquitetura)
O projeto foi estruturado de forma enxuta para facilitar a manutenção e o entendimento do fluxo de dados:

main.dart          ---Inicialização do app, tema global (Slate & Teal) e rota inicial.
login.dart         ---Controle de autenticação e tela de boas-vindas do aluno.
CalendarPage.dart  ---Renderização do calendário e amarração do mapa de dados.
toDoListPage.dart  ---Modelo da classe Task e gerenciamento da lista de afazeres.

Principais estruturas do framework utilizadas: 

-Gerenciamento de estado dinâmico (StatefulWidget e setState);
-Estrutura de dados baseada em chave-valor (Map<dateTime, List<Task>>);
-Navegação e controle de pilha (Navigator);
-Algoritmo de ordenação customizado (sort);

Tecnologias e dependências
Flutter SDK 3.0+ & Dart 3.0+: base estável para compilação multiplataforma.

table_calendar: biblioteca externa integrada para renderização do grid de datas. Os componentes visuais internos do pacote (como as marcações de dia selecionado e setas de navegação) foram sobrescritos com formatos retangulares (BoxShape.rectangle) e ícones customizados para preservar a identidade visual do app.
