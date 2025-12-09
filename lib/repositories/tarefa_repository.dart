import 'package:meu_app/model/tarefa.dart';

class TarefaRepository {
  List<Tarefa> _tarefas = [];


  //getter da lista
  Future<List<Tarefa>> listarTarefas() async{
    await Future.delayed(const Duration(milliseconds: 200));
    return _tarefas;
  }

  //setter da lista
  Future<void> adicionar(Tarefa tarefa) async{
    await Future.delayed(const Duration(milliseconds: 200));
    _tarefas.add(tarefa);
  }

  //alterar lista
  Future<void> alterar(String id, bool concluido) async {
  await Future.delayed(const Duration(milliseconds: 200));

  try {
    final tarefa = _tarefas.firstWhere((t) => t.id == id);
    tarefa.concluido = concluido;
  } catch (e) {
    // tarefa não encontrada, não faz nada
  }
}

  
  Future<List<Tarefa>> listarNaoConcluidas() async{
    await Future.delayed(const Duration(milliseconds: 200));
    return _tarefas.where((tarefa) => !tarefa.concluido).toList();
  }

  //remove  
  Future<void> remove(String id,) async{
    await Future.delayed(const Duration(milliseconds: 200));
    _tarefas.remove(
    _tarefas.where((tarefa) => tarefa.id == id).first
    );
  }
}