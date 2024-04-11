import 'package:flutter/material.dart';

class Tela2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => calcular();
}

class calcular extends State<Tela2> {
  TextEditingController altura = TextEditingController();
  TextEditingController peso = TextEditingController();
  double resultado = 0.0;
  String descricao = '';
  String imagem = '';

  void encontrarIMC() {
    //converte texto em numero B)
    double alturaValor = double.tryParse(altura.text) ?? 0.0;
    double pesoValor = double.tryParse(peso.text) ?? 0.0;

    //se altura for maior que zero e peso tbm
    if (alturaValor > 0 && pesoValor > 0) {
    } else {
      setState(() {
        resultado = 0.0;
        descricao = 'Insira um valor" Algo está errado';
      });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 16, 24),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title:
            Text('Calculadora de IMC', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: altura,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Altura (cm)',
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            TextField(
              controller: peso,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Peso(kg)',
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: encontrarIMC,
              child: Text(
                'Calcular IMC',
              ),
            ),
            SizedBox(height: 60),
            Text(
              'Classificação: $descricao',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
