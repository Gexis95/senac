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
      home: Pagina1(),
    );
  }
}

class Pagina1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( //fornece as estruturas basicas

      appBar: AppBar(//barra de cima

        //texto e cor da barra
        title: const Text(
          'Página 1',
           style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,//cor da barra
      ),

      body: Center(   //corpo da aplicação
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://miro.medium.com/v2/resize:fit:578/1*szmA2b5DQS_U5wAGgHiPQg.png', width: 300, height: 300,),
            const Text('Bem-Vindo a tela Inicial'),
          ],
        ),      
      ),

    );
  }
}
