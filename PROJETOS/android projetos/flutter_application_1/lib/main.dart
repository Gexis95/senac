// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

  //onde a execução do programa começa - principal

  void main() {
    runApp(const Aplicativo());   //roda aplicativo

  }
  //classe aplicativo (contén caracteristicas, variaveis e funções)
  //extens - extende - Herda caracteristicas do widget stateless
  //stateless - toda interface é imutavel após a criação 
  class Aplicativo extends StatelessWidget {
  const Aplicativo({super.key});// classe pai

    //build - método que recostroi tela
      @override
  Widget build(BuildContext context) {
    //widget responsável pelo design da aplicação, fornece temas e recursos

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home - tela principal - scaffold fornece layout basico
      home : Scaffold(
        appBar: AppBar(                                         //barra superior
          backgroundColor: Color.fromARGB(255, 0, 42, 255),   //cor do fundo da barra
          title: const Text(                                    //coloca titulo/texto na barra
            'UADAHEL',
          style: TextStyle(color: Colors.white),              //alterar a cor do texto

          ),
        ),
        
        //corpo do app
        body: const Center(
          child: SizedBox(
            child: Text(
              'Hello World',
               style: TextStyle(
                fontSize: 30,
                fontFamily: 'roboto',
                ),
              ),
            height: 200,
            width: 200,
          ),
        ),
        
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 0, 42, 255),
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}

