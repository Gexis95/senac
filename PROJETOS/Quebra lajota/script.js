//definir área do canvas
var canvas = document.getElementById("gameCanvas");
var desenho = canvas.getContext("2d");

//configurar raquete
var raqueteAltura = 10;
var raqueteLargura = 75;
var raqueteX = (canvas.width - raqueteLargura) / 2; //centraliza a raquete
var velocidadeRaquete = 10;

//configurar a bola
var bolaRadius = 3;
var bolaX = canvas.width / 2;
var bolaY = canvas.height - 30;
var bolaDX = 10;                         //direção de bola em X(esquerda/direita)
var bolaDY = -10;                        //direção da bola em Y(acima/abaixo)

//configurar os tijolos
var tijolosPorLinha = 3;
var tijolosPorColuna = 8;
var tijoloLargura = 75;
var tijoloAltura = 20;
var tijoloEspacamento = 2;
var espacamentoSuperiorQuadro = 1;
var espacamentoEsquerdoQuadro = 1;
var tijolos = []; //lista com os tijolos

//dedicado apenas a inicialização dos tijolos
for(var coluna=0;coluna< tijolosPorColuna; coluna++ ){
    tijolos[coluna] = []

    for(var linha =0; linha < tijolosPorLinha; linha++){
    
        tijolos[coluna][linha] = {x:0, y:0, ativo:1 }
    }
}

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
                desenho.fillStyle = "green"
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

                if(bolaX > tijolo.x
                    && bolaX < tijolo.x + tijoloLargura
                    && bolaY > tijolo.y
                    && bolaY < tijolo.y + tijoloAltura){
                        bolaDY = -bolaDY;
                        tijolo.ativo =0;

                    }
            }
        }
    }
}


function gameOver(){
    var gameover = document.getElementById(gameOver);
    gameover.style.display = "block";
}

function reiniciar(){
    document.location.reload;
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
    }

    //analisa a colição com o topo
    if(bolaY + bolaDY < bolaRadius){
        bolaDY = -bolaDY;
    }

    else if(bolaY + bolaDY > canvas.height - bolaRadius){
        
        if(bolaX > raqueteX && bolaX < raqueteX + raqueteLargura){
            bolaDY = -bolaDY;
        }else{
            gameOver();
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