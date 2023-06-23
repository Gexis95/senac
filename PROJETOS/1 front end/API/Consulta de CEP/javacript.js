function buscar(){
    var cep = document.getElementById('cep').value;                 //input de cep, do HTML
    var url = 'https://viacep.com.br/ws/'+cep+'/json/';             //link de busca da api

    fetch(url)                                                      //vai buscar a url
        .then(response => response.json())                          //assincrono, espera um arquivo json
        .then(data => {                                              //irá esperar para a verificação de algum dado

            if(data.erro){
                document.getElementById('resultado').textContent = 'CEP não encontrado';
            }else{
                document.getElementById('resultado').innerHTML =
                    '<strong> Cidade: </strong>'+ data.localidade + '<br>'
                    +'<strong> Cep: </strong>' + data.cep + '<br>'
                    +'<strong> Logradouro: </strong>' + data.logradouro + '<br>'
                    +'<strong> Bairro: </strong>' + data.bairro + '<br>'
                    +'<strong> Complemento: </strong>' + data.complemento + '<br>'
                    +'<strong> Estado: </strong>' + data.uf + '<br>'
                    +'<strong> Código IBGE: </strong>' + data.ibge + '<br>'
                    +'<strong> DDD: </strong>' + data.ddd + '<br>';
            }
            

        }).catch(error => alert('deu errado ' + error));              //caso tenha algo errado, imprime o erro
    
    }