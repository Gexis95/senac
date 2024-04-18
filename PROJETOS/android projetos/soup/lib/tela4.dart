import 'package:flutter/material.dart';

class Tela4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => calcular();
}

class calcular extends State<Tela4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 16, 24),
      appBar: AppBar(
        title: Text('Calculadora de Gorgeta', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[],
      ),
      ),

    );
  }
}
