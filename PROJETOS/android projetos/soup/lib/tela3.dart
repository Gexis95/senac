// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Tela3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => calcular();
}

class calcular extends State<Tela3> {
  TextEditingController preco = TextEditingController();
  TextEditingController desconto = TextEditingController();
  double precoFinal = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 16, 24),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Calculadora de Desconto',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [],
        ),
      ),
    );
  }
}
