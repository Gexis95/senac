import 'package:flutter/material.dart';
import 'package:soup/Tela1.dart';

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
      },
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Principal',
         style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          children: <Widget>[
            Botao(text: 'Tela1', route: '/tela1', icons: Icons.home),
          ],
        ),
      ),
    );
  }
}
