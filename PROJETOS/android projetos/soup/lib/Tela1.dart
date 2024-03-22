import 'package:flutter/material.dart';

class Tela1 extends StatefulWidget {
  @override
  calcularCombustivelEstado createState() => calcularCombustivelEstado();
}

class calcularCombustivelEstado extends State<Tela1> {
  //variaveis do app.
  TextEditingController entradaAlcool = TextEditingController();
  TextEditingController entradaGasolina = TextEditingController();
  IconData icone = Icons.help;
  Color corIcone = Colors.black;
  String resultado = '';

  void calcularOpcao() {
    double precoAlcool = double.tryParse(entradaAlcool.text) ?? 0.00;
    double precoGasolina = double.tryParse(entradaGasolina.text) ?? 0.00;

    //se o precoAlool = 0 ou precoGasolina = 0
    if (precoAlcool == 0 || precoGasolina == 0) {
      setState(() {
        //troca o icone pra vermelho
        icone = Icons.error;
        corIcone = Colors.red;
        //informa o usuário do erro cometido
        resultado = 'Por favor insira o preço do alcool ou gasolina';a
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Álcool ou Gasolina?',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: entradaAlcool,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Preço do Álcool'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: entradaGasolina,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Preço da Gasolina'),
            ),
            const SizedBox(height: 20),
            const ElevatedButton(
              onPressed: null,
              child: Text('Calcular'),
            ),
            const SizedBox(
              height: 20,
            ),
            Icon(icone, size: 100, color: corIcone),
            const SizedBox(
              height: 10,
            ),
            Text(
              resultado,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
