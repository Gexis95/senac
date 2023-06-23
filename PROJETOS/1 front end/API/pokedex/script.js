var contador=0;
function buscar(){
    var entrada = document.getElementById("entrada").value.toLowerCase();
    

    if(entrada.length < 1){
        entrada = contador;
    }
    var url ="https://pokeapi.co/api/v2/pokemon/"+entrada;

    fetch(url)
    .then(response => response.json())
    .then(data => {

        var tela = document.getElementById("tela");
        tela.innerHTML = 
            '<h2>'+ data.name +'</h2>' 
            +'<img class="pokemon" src="'+data.sprites.front_default+'">'
            //+'<img class="pokemon" src="'+data.sprites.back_default+'" alt="não encontrado">'
            +'<p> ID:'+data.id+' </p>'
            +'<p> Tipagem:'+ data.types.map(type => type.type.name).join("-")+'</p>'
            +'<p> Habilidades:' +data.abilities.map(ability => ability.ability.name)+'</p>';


            contador = data.id;                             //atualiza o contador para o id do pokemon
            document.getElementById("entrada").value="";    //limpa o input de entrada

    }).catch(error =>{
        var tela = document.getElementById("tela");
        tela.innerHTML = '<p>Pokémon não encontrado :(</p>';
    })

   
}


function anterior(){
    contador = contador -1;
    buscar();
    

}

function proximo(){
    contador = contador + 1;
    buscar();
    

}
