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

//variaveis
//"_" indica que a classe é privada
class _EstadoAplicativo extends State<Aplicativo> {
  int contador1 = 0;
  int contador2 = 0;
  var _tempo = 60;
  late Timer _timer;
  bool _clique = true;
  Color cor1 = Colors.black;
  Color cor2 = Colors.black;

  @override
  void initState() {
    super.initState();
    _iniciarTimer();
  }

  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _iniciarTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_tempo > 0) {
          _tempo--;
        } else {
          _timer.cancel;
          _clique = false;
        }
      });
    });
  }

  void mudarCor() {
    if (contador1 > contador2) {
      cor1 = Colors.red;
      cor2 = Colors.black;
    } else if (contador2 > contador1) {
      cor1 = Colors.black;
      cor2 = Colors.red;
    } else {
      cor1 = Colors.blue;
      cor2 = Colors.blue;
    }
  }

  void _reiniciar() {
    setState(() {
      contador1 = 0;
      contador2 = 0;
      _tempo = 60;
      _clique = true;
    });
    _timer.cancel();
    _iniciarTimer();
  }

  @override
  Widget build(BuildContext context) {
    mudarCor();
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
                style: TextStyle(fontSize: 30, color: cor1),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Contador 2: $contador2',
                style: TextStyle(fontSize: 30, color: cor2),
              ),
              const SizedBox(height: 30),
              Text(
                'Tempo restante: $_tempo segundos',
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
                    if (_clique == true) {
                      contador1++;
                    }
                  });
                },

                tooltip: 'Incrementar Contador 1',
                child: const Icon(Icons.add),
              ),
            ),
            FloatingActionButton(
              onPressed: _reiniciar,
              tooltip: 'Zerar Contagem',
              child: const Icon(Icons.refresh),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.00),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_clique == true) {
                      contador2++;
                    }
                  });
                },
                tooltip: 'Incrementar contador 2',
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
