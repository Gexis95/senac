async function buscarClima(){
    var cidade = document.getElementById("cidade").value;
    var chave  = 'd68195c5a197d6686e694edc1c55bef6';  
    var url    = 'https://api.openweathermap.org/data/2.5/weather?q='+cidade+'&appid='+chave+'&units=metric';


    try{
        var resposta = await fetch(url);
        var dado = await resposta.json();

        var resultado = document.getElementById("resultado")
        resultado.innerHTML =
        '<h2> Previsão de Tempo Para '+dado.name +' </h2>'
        +'<p> Temperatura: '+dado.main.temp + 'C° </p> '
        +'<p> Temperatura Máxima: '  +dado.main.temp_max + 'C° </p>'
        +'<p> Temperatura Mínima: '  +dado.main.temp_min + 'C° </p>'
        +'<p> Sensação Térmica : '   +dado.main.feels_like + 'C° </p>'
        +'<p> Humidade: '            +dado.main.humidity + '% </p>'
        +'<p> Nuvens: '              +dado.clouds.all + '% </p>'
        +'<img class="imgTempo" src="https://openweathermap.org/img/wn/'+dado.weather[0].icon+'@2x.png">'

    }catch(error){
        var resultado = document.getElementById("resultado");
        resultado.innerHTML = "<p>Erro ao buscar o clima:"+error;
    }
} 