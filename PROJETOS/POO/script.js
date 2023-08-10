//sem orientação a obejetos
var nome1 = 'Paula';
var nome2 = 'Juliana';
var nome3 = 'Alana';

var idade1 = 25;
var idade2 = 30;
var idade3 = 40

function falar(nome, idade){
    alert ('Sem orientação a objetos: Olá sou '+nome+' e tenho '+idade+ ' anos')
}
falar(nome1, idade1);
falar(nome2, idade2);
falar(nome3, idade3);
;

//com orientação a objetos
// Classe
class Pessoa {
    constructor(nome, idade) {
        this.nome = nome;
        this.idade = idade; 
    }
    falar(){
        alert("Olá, meu nome é "+this.nome+" e tenho "+this.idade+" anos")
    }
}

// Instanciando Objeto 

var pessoa1 = new Pessoa('Astolfo', 71);
var pessoa2 = new Pessoa('Malvina', 50);
var pessoa3 = new Pessoa('Muriel',65);

pessoa1.falar();
pessoa2.falar();
alert('Olá, sou o '+ pessoa3.nome );

//herança e polimorfismo
//criando a classe "pai"
class animal{
    constructor(nome){
        this.nome = nome;
    }
    fazerBarulho(){
        alert("Fazendo barulho genérico");
    }
}

//criando classes "filhas" de animal
class cachorro extends animal{ //classe cachorro herdando as heranças de animal
    constructor(nome, raca){
        super(nome);          //puxa o nome da class animal
        this.raca = raca;
    }
    fazerBarulho(){
        alert("Cachorro Latindo!");
    }
}

class gato extends animal{
    constructor(nome, cor){
        super(nome);
        this.cor = cor
    }
    fazerBarulho(){
        alert("Gato Miando");
    }
}

var objetoCachorro = new cachorro('Fred','Schnauzer');
alert(objetoCachorro.nome);
alert(objetoCachorro.raca);
objetoCachorro.fazerBarulho();

var objetoGato = new gato('Sininho', 'cinza')
objetoGato.nome = 'Garfield'; //alterando valores publicos
objetoGato.cor = 'Laranja';   //alterando o valor publico "cor"
alert(objetoGato.gato.nome);
alert(objetoGato.gato.cor);
objetoGato.fazerBarulho(); //miando

//encapsulamento, modificador de acesso
class contaBancaria{
        constructor(saldo){
        this._saldo = saldo; // _ significa privado
    }
    get obterSaldo(){
        return this._saldo;
    }
    depositar(valor){
        this._saldo = this._saldo + valor;
    }
    sacar(){
        if(valor <= this._saldo){
            this._saldo = this._saldo - valor;
        } 
        else {
            alert("Valor maior que o saldo");
        }
    }
}

var minhaConta = new contaBancaria(20000);
alert(minhaConta.obterSaldo);
minhaConta.depositar(100);
alert(minhaConta.obterSaldo);
minhaConta.depositar(100);
alert(minhaConta.obterSaldo);
minhaConta.sacar(10000);
alert(minhaConta.obterSaldo);