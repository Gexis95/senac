// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(Aplicativo());
}

class Aplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pagina1()
    );
  }
}

class Pagina1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //fornece as estruturas basicas

      appBar: AppBar(
        //barra de cima

        //texto e cor da barra
        title: const Text(
          'Página 1',
          style: TextStyle(color: Colors.white)
        ),
        backgroundColor: Colors.blue, //cor da barra
      ),

      body: Center(
        //corpo da aplicação
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://miro.medium.com/v2/resize:fit:578/1*szmA2b5DQS_U5wAGgHiPQg.png',
              width: 300,
              height: 300
            ),
            const Text(
              'Bem-Vindo a tela Inicial',
              style: TextStyle(fontSize: 30)
            ),
            const Text(
              'Flutter é uma ferramenta multiplataforma - Android e IOS com um único código',
            ),
            const SizedBox(
              height: 20
            ), //quebra de linha
            ElevatedButton(
              onPressed: () {
                //Navigator, gerencia navegações entre telas
                Navigator.push(
                  //context identifica a pagina atual
                  context,
                  //MaterialPage define a animação e layout e usa o builder para aprensentar a próxima tela
                  MaterialPageRoute(builder: (context)=> Pagina2())
                );
              },
              child: const Text('Ir para Página 2')
            ),
          ],
        ),
      ),
    );
  }
}

class Pagina2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: const Text('Pagina 2'),
      backgroundColor: Colors.green
    ),

    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://dart.dev/assets/shared/dart-logo-for-shares.png?2',
            width: 400,
            height: 400,
          ),
          const SizedBox(height: 20),

          const Text(
            'Linguagem DART',
            style: TextStyle(fontSize: 30)
          ),

          const Text(
            'É uma linguagem versátil que combina eficiência e desempenho'
          ),
          const SizedBox(height: 20),

          ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> Pagina3())
                );
          },
          child: const Text('Ir para Página 3'),
          ),
        ],
      ),
    ),
   );
  }


}