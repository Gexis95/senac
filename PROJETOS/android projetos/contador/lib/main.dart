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
  double posicao = 0;

  void movimentar() {
    setState(() {
      if (contador1 > contador2) {
        posicao = 50;
      } else if (contador2 > contador1) {
        posicao = MediaQuery.of(context).size.width - 150;
      } else {
        posicao = MediaQuery.of(context).size.width / 2 - 50;
      }
    });
  }

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
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Jogador 1: $contador1',
                    style: TextStyle(fontSize: 30, color: cor1),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Jogador 2: $contador2',
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
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              bottom: 700.0,
              left: posicao,
              curve: Curves.easeInOut,
              child: Image.network(
                  'data:image/jpeg;base64,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',
                  width: 100,
                  height: 100),
            )
          ],
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
                      movimentar();
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
                      movimentar();
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
