
class ConfiguracoesModel {
  String _nomeUsuario = "";
  double _altura = 0;
  bool _receberNotificacoes = false;
  bool _temaEscuro = false;

  ConfiguracoesModel.vazio();

  ConfiguracoesModel(
    this._nomeUsuario,
    this._altura,
    this._receberNotificacoes,
    this._temaEscuro,
  );

  // Getters
  String get nomeUsuario => _nomeUsuario;
  double get altura => _altura;
  bool get receberNotificacoes => _receberNotificacoes;
  bool get temaEscuro => _temaEscuro;

  // Setters
  set nomeUsuario(String value) => _nomeUsuario = value;
  set altura(double value) => _altura = value;
  set receberNotificacoes(bool value) => _receberNotificacoes = value;
  set temaEscuro(bool value) => _temaEscuro = value;
}
