import 'package:flutter/material.dart';

void main() {
  runApp(const Aplicativo());
}

class Aplicativo extends StatefulWidget {
  const Aplicativo({Key? key}) : super(key: key);

  @override
  State<Aplicativo> createState() => _EstadoAplicativo();
}

//"_" indica que a classe é privada
class _EstadoAplicativo extends State<Aplicativo> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 33, 0, 79),
          title: const Text('Jogo contador', style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
