//definir área do canvas
var canvas = document.getElementById("gameCanvas");
var desenho = canvas.getContext("2d");

//configurar raquete
var raqueteAltura = 10;
var raqueteLargura = 1000;
var raqueteX = (canvas.width - raqueteLargura) / 2; //centraliza a raquete
var velocidadeRaquete = 12;

//configurar a bola
var bolaRadius = 10;
var bolaX = canvas.width / 2;
var bolaY = canvas.height - 30;
var bolaDX = 7;                         //direção de bola em X(esquerda/direita)
var bolaDY = -7;                        //direção da bola em Y(acima/abaixo)

//configurar os tijolos
var tijolosPorLinha = 1;
var tijolosPorColuna = 1;
var tijoloLargura = 750;
var tijoloAltura = 20;
var tijoloEspacamento = 2;
var espacamentoSuperiorQuadro = 1;
var espacamentoEsquerdoQuadro = 1;
var tijolos = []; //lista com os tijolos

var pontosPorTijolo = 100;
var totalPontuacao = tijolosPorLinha * tijolosPorColuna * 100;
var pontuacao = 0;


function facil(){
    raqueteLargura = 90;
    tijolosPorLinha = 2;
    tijolosPorColuna = 5;
    tijoloLargura = 115;
    tijoloEspacamento = 5;
    bolaRadius = 12;
    bolaDX = 3;
    bolaDY = -2;
    bolaX = canvas.width / 2;
    bolaY = canvas.height - 30; 
    totalPontuacao = tijolosPorLinha * tijolosPorColuna * 100;
    pontuacao = 0;
    iniciarTijolos();
}

function medio(){
    raqueteLargura = 75;
    tijolosPorLinha = 2;
    tijolosPorColuna = 5;
    tijoloLargura = 115;
    tijoloEspacamento = 5;
    bolaRadius = 10;
    bolaDX = 6;
    bolaDY = -5;
    bolaX = canvas.width / 2;
    bolaY = canvas.height - 30;  
    totalPontuacao = tijolosPorLinha * tijolosPorColuna * 100;
    pontuacao = 0;
    iniciarTijolos();
}

function dificil(){
    raqueteLargura = 75;
    tijolosPorLinha = 3;
    tijolosPorColuna = 8;
    tijoloLargura = 75;
    tijoloAltura = 20;
    tijoloEspacamento = 2;
    bolaRadius = 10;
    bolaDX = 7;
    bolaDY = -7;
    bolaX = canvas.width / 2;
    bolaY = canvas.height - 30; 
    totalPontuacao = tijolosPorLinha * tijolosPorColuna * 100;
    pontuacao = 0;
    iniciarTijolos();
}

function ultra(){
    raqueteLargura = 70;
    velocidadeRaquete = 18;
    tijolosPorLinha = 3;
    tijolosPorColuna = 8;
    tijoloLargura = 75;
    tijoloAltura = 20;
    tijoloEspacamento = 2;
    bolaRadius = 8;
    bolaDX = 12;
    bolaDY = -12;
    bolaX = canvas.width / 2;
    bolaY = canvas.height - 30; 
    totalPontuacao = tijolosPorLinha * tijolosPorColuna * 100;
    pontuacao = 0;
    iniciarTijolos();
}

function iniciarTijolos(){
            //dedicado apenas a inicialização dos tijolos
            for(var coluna=0;coluna< tijolosPorColuna; coluna++ ){
                tijolos[coluna] = []

            for(var linha =0; linha < tijolosPorLinha; linha++){
        
                tijolos[coluna][linha] = {x:0, y:0, ativo:1 }
        }
    }
}

iniciarTijolos();

var setaDireita = false;
var setaEsquerda = false;

//movimentação da raquete
document.addEventListener("keydown", descerDaTecla);
document.addEventListener("keyup", subirDaTecla);

function descerDaTecla(tecla){
    if(tecla.key === "d" || tecla.key === "D" || tecla.key === "ArrowRight" || tecla.key === "Right"){
        setaDireita = true;

    }else if(tecla.key === "a" || tecla.key === "A" || tecla.key === "ArrowLeft" || tecla.key === "Left"){
        setaEsquerda = true;
    }
}

function subirDaTecla(tecla){
    
    if(tecla.key === "d" || tecla.key === "D" || tecla.key === "ArrowRight" || tecla.key === "Right"){
        setaDireita = false;

    }else if(tecla.key === "a" || tecla.key === "A" || tecla.key === "ArrowLeft" || tecla.key === "Left"){
        setaEsquerda = false;
    }
}

function desenharRaquete(){
    desenho.beginPath(); //iniciar desenho da raquete
    desenho.rect(raqueteX, canvas.height - raqueteAltura, raqueteLargura, raqueteAltura);
    desenho.fillStyle = "blue";
    desenho.fill();
    desenho.closePath();
}

function desenharBola(){
    desenho.beginPath();
    desenho.arc(bolaX, bolaY, bolaRadius, 0, Math.PI * 2);
    desenho.fillStyle = "black";
    desenho.fill();
    desenho.closePath();
}

function desenharTijolos(){
    for(var coluna = 0; coluna < tijolosPorColuna; coluna++){
        for(var linha = 0; linha < tijolosPorLinha; linha++){ 
            
            if(tijolos [coluna][linha].ativo == 1){

                var tijoloX = (coluna * (tijoloLargura + tijoloEspacamento)+ espacamentoEsquerdoQuadro);
                var tijoloY = (linha * (tijoloAltura + tijoloEspacamento)+ espacamentoSuperiorQuadro);

                tijolos[coluna][linha].x = tijoloX;
                tijolos[coluna][linha].y = tijoloY;

                desenho.beginPath();
                desenho.rect(tijoloX, tijoloY, tijoloLargura, tijoloAltura);
                desenho.fillStyle = "green";
                desenho.fill();
                desenho.closePath(); 
            }
        }
    }
}

function detectarColisao(){
    for(var coluna = 0; coluna < tijolosPorColuna; coluna++){
        for(var linha = 0; linha < tijolosPorLinha; linha++){

            var tijolo = tijolos[coluna][linha];

            if(tijolo.ativo === 1){

                if(bolaX +bolaRadius > tijolo.x
                    && bolaX - bolaRadius < tijolo.x + tijoloLargura
                    && bolaY + bolaRadius > tijolo.y
                    && bolaY - bolaRadius < tijolo.y + tijoloAltura){
                        bolaDY = -bolaDY;
                        tijolo.ativo =0;
                        tela = document.getElementById("ponto");
                        pontuacao = pontuacao + pontosPorTijolo;
                        tela.innerHTML = "Pontuação: " + pontuacao;
                        gerarEfeitoSonoro('score.mp3');

                        if(pontuacao === totalPontuacao){
                            vitoria();
                            gerarEfeitoSonoro('victory.mp3')
                        }

                    }
            }
        }
    }
}


contador = 0;

function gameover(){
    var gameover = document.getElementById("gameover");
    gameover.style.display = "block";
    bolaDX = 0;
    bolaDY = 0;

    if(contador < 1){
        gerarEfeitoSonoro('lose.mp3');
    }
    contador = contador +1;
}

function reiniciar(){
    location.reload();
    contador = 0;
}


//reinicia a página ao pressionar R
document.addEventListener("keydown", function(apertaR) {
    if (apertaR.key === "r" || apertaR.key === "R") {
      reiniciar();
    }
  });


function vitoria(){
    var mensagem = document.getElementById("vitoria");
    mensagem.style.display = "block";
    bolaDX = 0;
    bolaDY = 0;

}


function gerarEfeitoSonoro(som){
    // Cria contexto de áudio.
    var contexto = new (window.AudioContext)
    // Faz uma requisição para carregar o arquivo de som.
    var requisicao = new XMLHttpRequest();
    requisicao.open('GET',som,true);
    requisicao.responseType = 'arraybuffer'; // Armazenar na memória.

    requisicao.onload = function(){
        // Decodificar o arquivo de som.
        contexto.decodeAudioData(requisicao.response, function(buffer) {
            // Reprodução do som.
            var fonte = contexto.createBufferSource();
            fonte.buffer = buffer;
            // Conectar saída de som.
            fonte.connect(contexto.destination);
            fonte.start(0); // Executa o som.
        });
    }
    requisicao.send();
}

function desenhar(){

    desenho.clearRect(0,0, canvas.width, canvas.height); //limpa o frame anterior
    desenharRaquete();
    desenharBola();
    desenharTijolos();
    detectarColisao();

    //analisar colisao eixoX, colisao canto direita/esquerda
    if(bolaX + bolaDX > canvas.width - bolaRadius || bolaX + bolaDX < bolaRadius){
        bolaDX = -bolaDX;
        gerarEfeitoSonoro('bonk.mp3');
    }

    //analisa a colição com o topo
    if(bolaY + bolaDY < bolaRadius){
        bolaDY = -bolaDY;
        gerarEfeitoSonoro('bonk.mp3');
    }

    else if(bolaY + bolaDY > canvas.height - bolaRadius - raqueteAltura){
        
        if(bolaX > raqueteX && bolaX < raqueteX + raqueteLargura){
            bolaDY = -bolaDY;
            gerarEfeitoSonoro('bonk.mp3');
        }else{
            gameover();
        }
    }

    //se setaDireita estiver ativo &&"e" raqueteX < largura do canvas - raqueteLargura
    if(setaDireita === true && raqueteX < canvas.width - raqueteLargura){
        raqueteX = raqueteX + velocidadeRaquete; //anda pra direita
    
    }

    //se setaEsquerda estiver ativo &&"e" raqueteX > 0"começo do canva"
    else if(setaEsquerda && raqueteX > 0){
        raqueteX = raqueteX - velocidadeRaquete; //anda pra esquerda
    }

    bolaX = bolaX + bolaDX; // faz a bola andar para direita/esquerda
    bolaY = bolaY + bolaDY; //                       cima/baixo

    requestAnimationFrame(desenhar) //atualiazar tela de forma suave
}
desenhar(); //chama a função desenhar