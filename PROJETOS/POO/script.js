// Classe

class Pessoa {
    constructor(nome, idade) {
        this.nome = nome;
        this.idade = idade; 
    }
    falar() {
        alert("Olá, meu nome é "+this.nome+" e tenho "+this.idade+" anos")
    }
}

// Instanciando Objeto 

var pessoal = new Pessoa('Astolfo', 71);
var pessoa2 = new Pessoa('Malvina', 50);

pessoa1.falar();
pessoa2.falar();

