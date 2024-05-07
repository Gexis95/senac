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
      setState(() {
        resultado = pesoValor / (alturaValor * alturaValor);
        descricao = classificar(resultado);
      });
    } else {
      setState(() {
        resultado = 0.0;
        descricao = classificar(resultado);
      });
    }
  }

  String classificar(double valor) {
    if (valor < 18.5) {
      return 'Abaixo do Peso';
    } else if (valor >= 18.5 && valor < 24.9) {
      return 'Peso normal';
    } else if (valor >= 25 && valor < 29.9) {
      return 'Sobrepeso';
    } else if (valor >= 30 && valor < 34.9) {
      return 'Obesidade Grau I';
    } else if (valor >= 35 && valor > 39.9) {
      return 'Obesidade Grau II';
    } else {
      return 'Obesidade Grau III';
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
                  labelText: 'Altura (M)',
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            TextField(
              controller: peso,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Peso (KG)',
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
              'Resultado: ${resultado.toStringAsFixed(3)}',
              style: TextStyle(fontSize: 20),
            ),
            Text('Classificação: $descricao', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
