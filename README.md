Este é um teste técnico para a Diario Escola.

## Como rodar os códigos

### Javascript

Primeiramente você deve ter o [node](https://nodejs.org/en) instalado na máquina.


Após a instalação rodar no terminal os comandos:
```bash
#Inicia a aplicação
node index.js
```
O resultado será mostrado no terminal.

### SQL

Você pode utilizar [esse site](https://sqliteonline.com/) para o teste do banco de dados. Veja o passo a passo.
1. Clicar em **import** no canto superior esquerdo.
2. Clicar em **open** para abrir o arquivo .sql.
3. Apontar para o arquivo /db.sql.
4. Clicar em **run** para rodar os comandos sql, criar as tabelas e executa-las.

### PHP

Você pode utilizar [esse site](https://www.w3schools.com/php/phptryit.asp?filename=tryphp_compiler) para o teste do código em php. Veja o passo a passo.
1. Copiar o código do arquivo /index.php.
2. Colar no editor de código.
3. Clicar em **RUN** para rodar o código
4. O resultado será mostrado no terminal integrado.

## Resolução dos desafios

### Javascript

A resolução dos desafios 1 e 2 estão presententes no código.

**Desafio bonus**

![Screenshot](/javascript-bonus.png)


A ordem de execução dos 'console.logs':
1. C
2. D

   
Pois B retorna antes que 'alertUser()' possa ser chamado e D não tem a função resolve(), ocasionando em uma possivel falha na execução do restante do código, assim A nunca sendo chamado.


Se organizarmos esses erros no código a ordem seria:
1. B
2. C
3. D
4. A

Pois as funções C e D mesmo sendo promises não custam tempo para sua execução, assim executando na mesma hora.


A resolução presente em './index.js' sugere que para simular um comportamento real as promises precisam de uma carga (simuladas com um timer). A ordem correta de inicialização seria:
1. B
2. A
3. C
4. D

### SQL

A resolução dos desafios 1, 2 e bonus estão presentes nos comandos SQL.

### PHP

A resolução dos desafios 1, 2 e 3 estão presentes no código.


