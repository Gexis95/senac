import 'package:flutter/material.dart';
import 'package:tarefas/modelo_tarefa.dart';

class Controle_tarefa extends ChangeNotifier {
  List<Modelo_tarefa> tarefas = [];

  void adicionar(String conteudo) {
    tarefas.add(Modelo_tarefa(titulo: conteudo));
    notifyListeners();
  }

  //excluir tarefa
  void remover(int id) {
    tarefas.removeAt(id);
    notifyListeners();
  }

  //método de conclusão de tarefas ou não (um checkzinho)
  void concluir(int id) {
    tarefas[id].completa = !tarefas[id].completa;
    notifyListeners();
  }
}
