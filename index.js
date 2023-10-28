/*
    1 > Percorra o objeto clientes e mostre o nome da cada cliente da seguinte maneira:
    “ultimoSobrenome, primeiroNome”;
*/

var clientes = [
    {
        id: 1,
        nome: 'Luis Santos Silveira',
        idade: 18
    },
    {
        id: 2,
        nome: 'Ricardo Lopes Alves',
        idade: 30
    },
    {
        id: 3,
        nome: 'Gustavo Silva Junior',
        idade: 26
    }
];

function retornarPrimeiroEUltimoNome(nomeCompleto){
    const arrayDeNomes = nomeCompleto.split(' ');

    const tamanhoDoArray = arrayDeNomes.length;

    const primeiroNome = arrayDeNomes[0];
    const ultimoNome = arrayDeNomes[tamanhoDoArray - 1];

    return `${ultimoNome} ${primeiroNome}`;
}

console.log('');
console.log('1 Lista de clientes');

clientes.forEach(cliente => {
    const primeiroEUltimoNome = retornarPrimeiroEUltimoNome(cliente.nome);

    console.log('> ' + primeiroEUltimoNome)
});

console.log('');

/*
    2 > Formate a variável “numero” para o seguinte formato: “(XX)_X_XXXX-XXXX”;
*/

var numero = "5(1)9-876-543-21";

function removerSimbolos(numero){
    const regex = new RegExp(/[\(\)\-]+/g);
    const numeroSemSimbolos = numero.replace(regex, '');

    return numeroSemSimbolos;
}

function formatarNumeroParaTelefone(numero){
    const numeroFormatado = numero.replace(/(\d{2})(\d{1})(\d{4})(\d{4})/, '($1) $2 $3-$4');

    return numeroFormatado;
}

function formatarNumero(numero){
    const numeroSemCaracteresEspeciais = removerSimbolos(numero);

    const numeroFormatado = formatarNumeroParaTelefone(numeroSemCaracteresEspeciais);

    return numeroFormatado;
}

console.log('2 Número formatado');
console.log('> ' + formatarNumero(numero));
console.log('');

/*
    3 > Bonus, versão refatorada.
*/

console.log('3 Bonus, refatoração');

async function a(){
    b();
    await c();
    await d();
    alertUser("a");
}

a();

// Função estava retornando vazio.
function b(){
    alertUser("b");
}

// As funções assincronas receberam um TimeOut para simular uma situação real.
function c(){
    return new Promise((resolve)=>{
        setTimeout(()=>{
            alertUser("c");

        }, 2000);
        resolve();
    })
}

// Função não tinha resolve(), ocasionando em um possivel loop infinito.
function d(){
    return new Promise((resolve)=>{
        setTimeout(()=>{
            alertUser("d");

        }, 2000);
        resolve();
    })
}

function alertUser(message){
    console.log("A função é: "+message);
}