import 'package:flutter/material.dart';

class Tela1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 1'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Column(
          children: <Widget>[
            Text('Olá Tela 1'),
            Icon(Icons.home, size: 100, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
