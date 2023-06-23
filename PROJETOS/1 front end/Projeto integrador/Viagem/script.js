$(window).scroll(function(){
    var posicao = $(this).scrollTop();
    $(".aviao").css({
        'right': posicao / 4 + '%'
    })
});

 //ao digitar faz automaticamente a busca
document.getElementById("busca").addEventListener("keyup", function(){
    
    var entrada = this.ariaValueMax.toLowerCase();                          //valor de entrada
    var cartoes = document.getElementsByClassName("card");                  //lista de cards

    for (var i=0; i < cartoes.length; i++){
        var nome = cartoes[i].getAttribute("data-name").toLowerCase();      //nome que está no data-name dos cards

        if(nome.indexOf(entrada) > -1){                                     //se for entrada a letra da busca
            cartoes[i].style.display = "";                                     
        }else{                                                              
            cartoes[i].style.display = "none";                              //se não for encontrado, desaparece div
        }
    }

});