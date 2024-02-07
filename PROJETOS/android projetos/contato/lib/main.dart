// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const Contato());
}

class Contato extends StatelessWidget {
  const Contato({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Principal(title: 'Contato Pessoal'),
    );
  }
}

class Principal extends StatefulWidget {
  const Principal({super.key, required this.title});
  final String title;

  @override
  State<Principal> createState() => _PrincipalEstado();
}

class _PrincipalEstado extends State<Principal> {
  final foto = const CircleAvatar(
    backgroundImage: NetworkImage(
        "data:image/jpeg;base64,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"),
    radius: 150,
  );

  final nome = const Text(
    'Guilherme F. Romeiro',
    style: TextStyle(fontSize: 30),
    textAlign: TextAlign.center,
  );

  final obs = const Text(
    'Programador | Full Stack | Senac',
    style: TextStyle(fontSize: 20, color: Colors.blue),
  );

  final email = IconButton(
    icon: const Icon(Icons.mail),
    color: Colors.blue,
    onPressed: () {
      launchUrl(Uri(
        scheme: 'mailto',
        path: 'romeiro.7910@aluno.pr.senac.br',
        queryParameters: {
          'subject': 'Assunto do email',
          'body': 'Corpo do email'
        },
      ));
    },
  );

  final telefone = IconButton(
    icon: const Icon(Icons.phone),
    color: Colors.blue,
    onPressed: () {
      launchUrl(Uri(scheme: 'tel', path: '+5540028922'));
    },
  );

  final sms = IconButton(
    icon: const Icon(Icons.sms),
    color: Colors.blue,
    onPressed: () {
      launchUrl(Uri(scheme: 'sms', path: '+5540028922'));
    },
  );

  final mapa = IconButton(
    icon: const Icon(Icons.map),
    color: Colors.blue,
    onPressed: () {
      launchUrl(Uri.parse('https://maps.app.goo.gl/JLC5GaYdGBon6J4CA'));
    },
  );

  final site = IconButton(
    color: Colors.blue,
    icon: const Icon(Icons.open_in_browser),
    onPressed: () {
      launchUrl(Uri.parse('https://www.google.com'));
    },
  );

  final whatsapp = IconButton(
    color: Colors.blue,
    icon: const Icon(Icons.wechat),
    onPressed: () {
      launchUrl(Uri.parse('https://api.whatsapp/+5540028922'));
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aplicativo de Contato',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          foto,
          nome,
          obs,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              email,
              telefone,
              sms,
              site,
              whatsapp,
              mapa,
            ],
          )
        ],
      ),
    );
  }
}
