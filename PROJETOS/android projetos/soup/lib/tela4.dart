import 'package:flutter/material.dart';

class Tela4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => calcular();
}

class calcular extends State<Tela4> {
  double valor = 0.0;
  int porcentagem = 10;

  double calcularTotal() {
    double qtdGorjeta = (valor * porcentagem) / 100;
    double total = qtdGorjeta + valor;
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 16, 24),
      appBar: AppBar(
        title: Text(
          'Calculadora de Gorgeta',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Valor da Conta'),
              onChanged: (value) {
                setState(() {
                  valor = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text('Porcentagem de Gorjeta: $porcentagem%', style: TextStyle(fontSize: 25)),
                ),
                Slider(
                  value: porcentagem.toDouble(),
                  min: 0,
                  max: 50,
                  divisions: 10,
                  onChanged: (double value){
                    setState(() {
                      porcentagem = value.round();
                    },);
                  } ),
              ],
            ),
            SizedBox(height: 30,),
            Text('Total da Conta: ${calcularTotal()}',
             style: TextStyle(fontSize: 25),),
            
            Text('Gorgeta: ${calcularTotal() - valor}',
             style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
