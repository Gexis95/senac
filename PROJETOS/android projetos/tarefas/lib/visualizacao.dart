import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarefas/controle_tarefa.dart';

void main() {
  runApp(Principal());
}

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Controle_tarefa(),

      child: MaterialApp(
        title: 'App de tarefas',
        home: telaTarefas(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class telaTarefas extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      appBar: AppBar(
      title: const Text(
        'App de Tarefas',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
      centerTitle: true,
      ),

      body: listaTarefas(),

      // ignore: prefer_const_constructors
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: const Icon(Icons.add),
      ),
    );
  }
}