//definir área do canvas
var canvas = document.getElementById("gameCanvas");
var desenho = canvas.getContext("2d");

//configurar raquete
var raqueteAltura = 10;
var raqueteLargura = 75;
var raqueteX = (canvas.width - raqueteLargura) / 2; //centraliza a raquete
var velocidadeRaquete = 7;

//configurar a bola
var bolaRadius = 10;
var bolaX = canvas.width / 2;
var bolaY = canvas.height - 30;
var bolaDX = 2;                         //direção de bola em X(esquerda/direita)
var bolaDY = -2;                        //direção da bola em Y(acima/abaixo)

var setaDireita = false;
var setaEsquerda = false;

//movimentação da raquete
document.addEventListener("keydown", descerDaTecla);
document.addEventListener("keyup", subirDaTecla);

function descerDaTecla(tecla){
    //se o valor = "direita" ||ou valor = "setaDireita"
    if(tecla.key === "Right" || tecla.key === "ArrowRight"){
        setaDireita = true; //ativa variavel setaDireita

    //se o valor = "direita" ||ou valor = "setaDireita"
    }else if(tecla.key === "Left" || tecla.key === "ArrowLeft"){
        setaEsquerda = true; //ativa variavel setaEsquerda
    }
}

function subirDaTecla(){

}

function desenharRaquete(){
    desenho.beginPath(); //iniciar desenho da raquete
    desenho.rect(raqueteX, canvas.height - raqueteAltura, raqueteLargura, raqueteAltura);
    desenho.fillStyle = "blue";
    desenho.fill();
    desenho.closePath();
}

function desenhar(){

    desenho.clearRect(0,0, canvas.width, canvas.height); //limpa o frame anterior
    desenharRaquete();

    //se setaDireita estiver ativo &&"e" raqueteX < largura do canvas - raqueteLargura
    if(setaDireita === true && raqueteX < canvas.width - raqueteLargura){
        raqueteX = raqueteX + velocidadeRaquete; //anda pra direita
    
    }

    //se setaEsquerda estiver ativo &&"e" raqueteX > 0"começo do canva"
    else if(setaEsquerda && raqueteX > 0){
        raqueteX = raqueteX - velocidadeRaquete; //anda pra esquerda
    }

    requestAnimationFrame(desenhar) //atualiazar tela de forma suave
}
desenhar(); //chama a função desenhar