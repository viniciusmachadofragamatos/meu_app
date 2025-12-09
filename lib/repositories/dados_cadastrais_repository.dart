import 'package:hive/hive.dart';
import 'package:meu_app/model/dados_cadastrais_model.dart';

class DadosCadastraisRepository {
  static late Box _box;
  DadosCadastraisRepository._criar();



  static Future<DadosCadastraisRepository> carregar() async {
    if (!Hive.isBoxOpen('dadosCadastraisModel')) {
      _box = await Hive.openBox('dadosCadastraisModel');
    } else {
      _box = Hive.box('dadosCadastraisModel');
    }
    return DadosCadastraisRepository._criar();
  }
  salvar(DadosCadastraisModel dadosCadastraisModel){
    _box.put('dadosCadastraisModel', dadosCadastraisModel);
  }

  DadosCadastraisModel obterDados(){
    var dadosCadastraisModel = _box.get('dadosCadastraisModel');
    if(dadosCadastraisModel == null) {
      return DadosCadastraisModel.vazio();
    }
    return dadosCadastraisModel;
  }
}