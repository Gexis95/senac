import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const Aplicativo());
}

class Aplicativo extends StatefulWidget {
  const Aplicativo({super.key});

  @override
  State<Aplicativo> createState() => _EstadoAplicativo();
}

//"_" indica que a classe é privada
class _EstadoAplicativo extends State<Aplicativo> {
  int contador1 = 0;
  int contador2 = 0;
  var _tempo = 60;
  late Timer _timer;
  bool _clique = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 33, 0, 79),
          title: const Text(
            'Jogo contador',
            style: TextStyle(color: Colors.white),
          ),
        ),

        //corpo do aplicativo +  centralização
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Contador 1: $contador1',
                style: const TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),

        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: FloatingActionButton(
                //onPressed: _clique ? (){setState(() {});} :null,
                onPressed: () {
                  setState(() {
                    contador1++;
                  });
                },
                tooltip: 'Incrementar Contador 1',
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
