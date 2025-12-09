
import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_CHAVES{
  CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA,
  CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA,
  CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO,
  CHAVE_DADOS_CADASTRAIS_LINGUAGENS,
  CHAVE_DADOS_CADASTRAIS_SALARIO,
  CHAVE_DADOS_CADASTRAIS_NOME,
  CHAVE_NOME_USUARIO,
  CHAVE_ALTURA,
  CHAVE_TEMA_ESCURO,
  CHAVE_RECEBER_NOTIFICACOES,
  CHAVE_QUANTIDADE_CLIQUES,
  CHAVE_NUMERO_ALEATORIO
}
class AppStorageService {
  //NUMERO ALEATORIO
  Future<void> setNumeroAleatorio(int value) async {
    await _setInt(STORAGE_CHAVES.CHAVE_NUMERO_ALEATORIO.toString(), value);
  }

  Future<int> getNumeroAleatorio() async {
    return _getInt(STORAGE_CHAVES.CHAVE_NUMERO_ALEATORIO.toString());
  }
  //QUANTIDADE CLIQUES
  Future<void> setQuantidadeCliques(int value) async {
    await _setInt(STORAGE_CHAVES.CHAVE_QUANTIDADE_CLIQUES.toString(), value);
  }

  Future<int> getQuantidadeCliques() async {
    return _getInt(STORAGE_CHAVES.CHAVE_QUANTIDADE_CLIQUES.toString());
  }
  
  // NOME
  Future<void> setDadosCadastraisNome(String nome) async {
    await _setString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString(), nome);
  }

  Future<String> getDadosCadastraisNome() async {
    return _getString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString());
  }
  
  
  //DATANASCIMENTO
    Future<void> setDadosCadastraisDataNascimento(DateTime data) async {
    await _setString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString(), data.toString());
  }

  Future<String> getDadosCadastraisDataNascimento() async {
    return _getString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString());
  }


  //NIVEL EXPERIENCIA

  Future<void> setDadosCadastraisNivelExperiencia(String nivel) async {
    await _setString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA.toString(), nivel.toString());
  }

  Future<String> getDadosCadastraisNivelExperiencia() async {
    return _getString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA.toString());
  }

  //LINGUAGENS
  Future<void> setDadosCadastraisLinguagens(List<String> values) async {
    await _setStringList(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGENS.toString(), values );
  }

  Future<List<String>> getDadosCadastraisLinguagens() async {
    return _getStringList(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGENS.toString());
  }

  //TEMPO EXPERIENCIA
  Future<void> setDadosCadastraisTempoExperiencia(int values) async {
    await _setInt(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString(), values);
  }

  Future<int> getDadosCadastraisTempoExperiencia() async {
    return _getInt(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString());
  }
  
  //SALARIO.
   Future<void> setDadosCadastraisSalario(double values) async {
    await _setDouble(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString(), values);
  }

  Future<double> getDadosCadastraisSalario() async {
    return _getDouble(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString());
  }
  
  //NOME USUARIO
  Future<void> setConfiguracoesNomeUsuario(String nome) async {
    await _setString(STORAGE_CHAVES.CHAVE_NOME_USUARIO.toString(), nome);
  }

  Future<String> getConfiguracoesNomeUsuario() async {
    return _getString(STORAGE_CHAVES.CHAVE_NOME_USUARIO.toString());
  }

  //ALTURA
  Future<void> setConfiguracoesAltura(double value) async {
    await _setDouble(STORAGE_CHAVES.CHAVE_ALTURA.toString(), value);
  }

  Future<double> getConfiguracoesAltura() async {
    return _getDouble(STORAGE_CHAVES.CHAVE_ALTURA.toString());
  }

  //RECEBER NOTIFICACAO
  Future<void> setConfiguracoesReceberNotificacoes(bool value) async {
    await _setBool(STORAGE_CHAVES.CHAVE_RECEBER_NOTIFICACOES.toString(), value);
  }

  Future<bool> getConfiguracoesReceberNotificacoes() async {
    return _getBool(STORAGE_CHAVES.CHAVE_RECEBER_NOTIFICACOES.toString());
  }

  //TEMAESCURO
  Future<void> setConfiguracoesTemaEscuro(bool value) async {
    await _setBool(STORAGE_CHAVES.CHAVE_TEMA_ESCURO.toString(), value);
  }

  Future<bool> getConfiguracoesTemaEscuro() async {
    return _getBool(STORAGE_CHAVES.CHAVE_TEMA_ESCURO.toString());
  }




  //MOLDE PARA PROXIMOS SET E GET COM SHAREDPREFERENCES DE TIPO STRING

  Future<void> _setString(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setString(chave, value);
  }
  Future<String> _getString(String chave) async{
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }
  
  //MOLDE PARA PROXIMOS SET E GET COM SHAREDPREFERENCES DE TIPO STRINGLIST

  Future<void> _setStringList(String chave, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setStringList(chave, values);
  }
  Future<List<String>> _getStringList(String chave) async{
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave) ?? [];
  }

  //MOLDE PARA PROXIMOS SET E GET COM SHAREDPREFERENCES DE TIPO INT

  Future<void> _setInt(String chave, int value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setInt(chave, value);
  }
  Future<int> _getInt(String chave) async{
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(chave) ?? 0;
  }
  //MOLDE PARA PROXIMOS SET E GET COM SHAREDPREFERENCES DE TIPO DOUBLE
  Future<void> _setDouble(String chave, double value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setDouble(chave, value);
  }
  Future<double> _getDouble(String chave) async{
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }
  //MOLDE PARA PROXIMOS SET E GET COM SHAREDPREFERENCES DE TIPO BOOL
  Future<void> _setBool(String chave, bool value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setBool(chave, value);
  }
  Future<bool> _getBool(String chave) async{
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }
  }