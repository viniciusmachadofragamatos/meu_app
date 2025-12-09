import 'package:hive/hive.dart';
import 'package:meu_app/model/tarefa_hive_model.dart';

class TarefaHiveRepository {
  static late Box _box;
  TarefaHiveRepository._criar();



  static Future<TarefaHiveRepository> carregar() async {
    if (!Hive.isBoxOpen('tarefaModel')) {
      _box = await Hive.openBox('tarefaModel');
    } else {
      _box = Hive.box('tarefaModel');
    }
    return TarefaHiveRepository._criar();
  }

  salvar(TarefaHiveModel tarefaHiveModel) {
    _box.add(tarefaHiveModel);
  }

  excluir(TarefaHiveModel tarefaHiveModel){
    tarefaHiveModel.delete();
  }
  alterar (TarefaHiveModel tarefaHiveModel){
    tarefaHiveModel.save();
  }
  List<TarefaHiveModel> obterDados(bool naoConcluido){
    if(naoConcluido) {
    return _box.values.cast<TarefaHiveModel>().where((element) => !element.concluido).toList();  
    }
    return _box.values.cast<TarefaHiveModel>().toList();
  }
}