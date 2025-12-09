import 'package:flutter/material.dart';

class Tarefa {
  String _id = UniqueKey().toString();
  String _descricao = "";
  bool _concluido = false;

  Tarefa(this._descricao, this._concluido,);

  //getter
  String get id => _id;
  String get descricao => _descricao;
  bool get concluido => _concluido;


  //setter
  set descricao(String descricao){
    _descricao = descricao;
  } 
  set concluido(bool concluido) {

  }

}