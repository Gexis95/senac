var jogador = "x";

function jogar(celula){


//compara se a celula está vazia para assim escrever
if(celula.innerHTML == ""){
    
    //escreve no HTML a letra
    celula.innerHTML = jogador;
    
    //alterna variavel jogador para a próxima jogada
    if(jogador == "x"){
        jogador = "o";
    
    }else{
        jogador = "x";
    
         }
    }
}

//função recarrega pagina
function reiniciar(){
    window.location.reload();
}

//fulano = 0, ciclano = 1, deltrano = 2, beltrano = 3
const nomes = ['fulano','ciclano','deltranho','beltrano','antedeguemon','paraguaio']; 

//sorteia um nome da lista, "Math.random vai sortear os itens", "math.floor arredonda o numero da lista"
function gerarbatalha(){
    const nome1 = nomes[Math.floor(Math.random() * nomes.length)];
    const nome2 = nomes[Math.floor(Math.random() * nomes.length)];

    //enquanto nome1 = nome2, sorteia novamente
    while(nome1 === nome2){
        gerarbatalha();
    }

    //escreve na tela
    document.getElementById('jogador1').textContent = nome1;
    document.getElementById('jogador2').textContent = nome2;
    
}

function adicionar() {
    var nome = document.getElementById("nome").value;
    nomes.push(nome);

    listar();
}

function listar(){
    var listagem = document.getElementById("lista");
    listagem.innerHTML = "";                        //limpa a lista

    for(var i = 0; i < nomes.length; i++){          //percorre todos os itens da lista
        
        var item = document.createElement("li");    //cria elemento <li> para o HTML

        var nomeitem = nomes [i];                   //guarda na variável nomeitem o nome especifico da lista
        item.innerHTML = nomeitem;                  //coloca valor dentro do <li>
        listagem.appendChild(item);                 //adiciona o <li> na lista do HTML, dentro do <ul>

    }
}