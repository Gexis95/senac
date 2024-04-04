import 'package:flutter/material.dart';
import 'package:soup/Tela1.dart';
import 'package:soup/tela2.dart';
import 'package:soup/tela3.dart';
import 'package:soup/tela4.dart';
import 'package:soup/tela5.dart';
import 'package:soup/tela6.dart';

void main() {
  runApp(Aplicativo());
}

class Aplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soup',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Menu(),
      routes: {
        '/tela1': (context) => Tela1(),
        '/tela2': (context) => Tela2(),
        '/tela3': (context) => Tela3(),
        '/tela4': (context) => Tela4(),
        '/tela5': (context) => Tela5(),
        '/tela6': (context) => Tela6(),
      },
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Menu Principal', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: const <Widget>[
            botao(
                texto: 'Melhor Combustivel',
                rota: '/tela1',
                icone: Icons.local_gas_station,
                cor: Colors.purple),
            botao(
                texto: 'IMC',
                rota: '/tela2',
                icone: Icons.accessibility,
                cor: Color.fromARGB(255, 255, 140, 0)),
            botao(
                texto: 'Desconto',
                rota: '/tela3',
                icone: Icons.money_off_csred_rounded,
                cor: Colors.red),
            botao(
                texto: 'Gorjeta',
                rota: '/tela4',
                icone: Icons.monetization_on,
                cor: Colors.green),
            botao(
                texto: 'Gasto de Cumbustivel',
                rota: '/tela5',
                icone: Icons.speed,
                cor: Colors.blue),
            botao(
                texto: 'Pomodoro',
                rota: '/tela6',
                icone: Icons.timer,
                cor: Color.fromARGB(255, 255, 200, 49)),
          ],
        ),
      ),
    );
  }
}

class botao extends StatelessWidget {
  final String texto;
  final String rota;
  final IconData icone;
  final Color cor;
  const botao(
      {Key? key,
      required this.texto,
      required this.rota,
      required this.icone,
      required this.cor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
        onPressed: () {
          Navigator.pushNamed(context, rota);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icone,
              color: cor,
              size: 50,
            ),
            SizedBox(height: 8),
            Text(
              texto,
              style: TextStyle(color: Colors.black, fontSize: 19.0),
            ),
          ],
        ),
      ),
    );
  }
}
