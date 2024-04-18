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

  void efetuarDesconto() {
    double precoValor = double.tryParse(preco.text) ?? 0.0;
    double descontoValor = double.tryParse(desconto.text) ?? 0.0;

    if (precoValor > 0 && descontoValor > 0 && descontoValor <= 100) {
      double qtdDesc = precoValor * (descontoValor / 100);

      setState(() {
        precoFinal = precoValor - qtdDesc;
      });
    } else {
      setState(() {
        precoFinal = 0.0;
      });
    }
  }

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
          children: [
            TextField(
                controller: preco,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Preço Original')),
            SizedBox(height: 20),
            TextField(
                controller: desconto,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Desconto (%)')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: efetuarDesconto, child: Text('Calcular')),
            SizedBox(height: 20,),
            Text(
              'Preço Final: $precoFinal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
