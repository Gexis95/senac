function buscar(){
    var seletor = document.getElementById('moeda').value;
    var resultado = document.getElementById('resultado');


    fetch('https://api.coingecko.com/api/v3/simple/price?ids='+seletor+'&vs_currencies=brl')     //buscar
        .then(response => response.json())                                                              //espera receber o arquivo json
        .then(data => {                                                                                  //espera o dado do arquivo json
            
            var preco = data[seletor].brl;
            resultado.textContent = formatar (preco);
            mudarImagem(seletor);


        }).catch(error => alert(error));
}

function formatar(valor){
    //mascara para formatar valor
    valor = Number(valor).toFixed(2).replace('.',',');
    valor = "R$"+valor;

    return valor;
}

function mudarImagem(seletor){
    var moeda = document.getElementById('imagem');

    if(seletor == "bitcoin"){
        moeda.innerHTML = '<img width="200px" src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png">'

    }else if(seletor == "ethereum"){
        moeda.innerHTML = '<img width="150px" src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/1257px-Ethereum_logo_2014.svg.png">'

    }else if (seletor == "litecoin"){
        moeda.innerHTML = '<img width="200px" src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/LTC-400.png/2048px-LTC-400.png">'
        
    }else if (seletor == "dogecoin"){
        moeda.innerHTML = '<img width="200px" src="https://cdn-icons-png.flaticon.com/512/6001/6001356.png">'
    }
}