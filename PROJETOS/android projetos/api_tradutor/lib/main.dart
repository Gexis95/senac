// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//método que roda a aplicação
void main() {
  runApp(Principal());
}

class Principal extends StatelessWidget {
  //construção do app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação com API',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: home(),
    );
  }
}

class home extends StatefulWidget {
  @override
  home_state createState() => home_state();
}

class home_state extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aplicativo com API',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 9, 59),
      ),
      body: Stack(
        children: [
          // 1 - representa a imagem fundo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.pexels.com/photos/998641/pexels-photo-998641.jpeg?cs=srgb&dl=pexels-francesco-ungaro-998641.jpg&fm=jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //2 - construção do card
          Padding(
            padding: const EdgeInsets.all(70.0),
            child: Center(

              child: Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const <Widget>[
                      Text('Ola Mundo'),
                      TextField(
                        controller: null,
                        decoration: InputDecoration(
                          labelText: 'Digite o texto', 
                          
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Texto Traduzido:',
                        style:TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                          SizedBox(height: 10.0),
                          Text('Tradução...', style: TextStyle(fontSize: 16.0)
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
