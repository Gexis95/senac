class livro{
    //classe livro
    constructor(titulo, autor){
        this.titulo = titulo;
        this.autor = autor;
    }
}

//classe responsavel por gerenciar os elementos em tela
class gerenciamento{
    constructor(){
        this.livros = []; //lista de livros
        this.formulario = document.getElementById('formulario');
        this.listagem = document.getElementById('listagem');

        //monitorar o submit(click no botão) do formulario
        this.formulario.addEventListener('submit', this.adicionar.bind(this));
    }
    adicionar(event){
        alert('teste');
        event.preventDefault();
        var titulo = document.getElementById('titulo').value;
        var autor = document.getElementById('autor').value;

        var livro = new livro(titulo,autor);//criando objeto livro
        this.livros.push(livro); //adiciona objeto livro na listra livros;
        this.exibirTela();
        titulo.value = ''; //limpar campo titulo
        autor.value = '';  //--     --    autor
    }
    exibirTela(){
        this.listagem.innerHTML = ''; //limpa lista
        for(var i=0; i < this.livros.length; i++){  //percorrer toda lista de livros
            var livro = this.book [i];
            var li = document.createElement('li');
            li.textContent = livro.titulo + ' por ' +livro.autor;
            this.listagem.appendChild(li);
        }
    }
}
var gerencia = new gerenciamento(); //instanciando um novo objeto gerenciamento