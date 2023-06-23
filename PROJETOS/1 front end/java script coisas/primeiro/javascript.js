alert('teste')


//função
function baixarestoque(){
    alert("Baixou Estoque");
}

function movimentarcaixa(){
    alert ("Caixa movimentado");    
}

function fazervenda(){
    baixarestoque();
    movimentarcaixa();


//DOM Object Document
var titulo = document.getElementById('texto');
    titulo.innerHTML = "novo texto";
}

//objeto
var pessoa = {idade:10, nome: 'Ricardo'};
alert(pessoa.nome);