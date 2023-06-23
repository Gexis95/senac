var frase = "Ser mãe é amar sem medidas.";

function gerarfrase(){
    var texto  = document.getElementById("frase")
    texto.innerHTML = frase;
}

function lerfrase(){
    var som = window.speechSynthesis;
    var discurso = new SpeechSynthesisUtterance(frase);
    som.speak(discurso)

}