# Guia de Testes e Cobertura de Código para NewsLens

Este documento fornece orientações sobre como executar testes e gerar relatórios de cobertura de código para o projeto NewsLens.

## Pré-requisitos

- Flutter SDK instalado e configurado.
- Homebrew instalado para instalar o lcov no macOS.
- lcov instalado através do Homebrew.

## Executando Testes

Para executar testes no projeto, siga os seguintes passos:

1. Abra o terminal.
2. Navegue até a pasta raiz do projeto NewsLens.
3. Execute o seguinte comando para rodar todos os testes:

    ```bash
    flutter test
    ```

## Gerando Relatórios de Cobertura de Código

Para gerar relatórios de cobertura de código, você precisará usar o lcov. Siga estas etapas:

### Instalar o LCOV

Se você ainda não tem o lcov instalado, execute o seguinte comando no terminal:

```bash
brew install lcov
```

### Gerar Dados de Cobertura

1. Na pasta raiz do projeto, execute os testes com a opção de cobertura:

    ```bash
    flutter test --coverage
    ```

   Isso criará um diretório `coverage` com um arquivo `lcov.info` que contém os dados de cobertura do código.

### Criar Relatório de Cobertura HTML

1. Gere o relatório HTML usando o lcov:

    ```bash
    genhtml -o coverage/html coverage/lcov.info
    ```

2. Este comando processa os dados de cobertura e cria um relatório visual no diretório `coverage/html`.

### Visualizar o Relatório

- Para visualizar o relatório de cobertura, abra o arquivo `index.html` localizado em `coverage/html` com um navegador web. Este relatório oferece uma visão detalhada da cobertura de código, incluindo quais linhas foram cobertas pelos testes.

## Dicas Adicionais

- **Escreva Testes Completos**: Certifique-se de que os novos recursos e correções de bugs sejam acompanhados por testes relevantes. Isso ajuda a manter a qualidade e a estabilidade do código.
- **Regularmente Atualize os Testes**: À medida que o código evolui, os testes também devem ser atualizados para refletir as mudanças.
- **Monitore a Cobertura**: Acompanhe regularmente a cobertura de código do projeto para garantir que permaneça alta. Isso é especialmente importante após grandes refatorações ou adições de recursos.
- **Use os Relatórios para Melhorias**: Utilize os relatórios de cobertura para identificar áreas do código que podem necessitar de mais testes.

Em caso de dúvidas ou problemas ao gerar relatórios de cobertura, não hesite em abrir um 'issue' no repositório do projeto.

---

Documentação para o projeto NewsLens. Desenvolvido com ❤️ pela equipe NewsLens.

