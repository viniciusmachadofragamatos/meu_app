import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NumerosAleatoriosHivePage extends StatefulWidget {
  const NumerosAleatoriosHivePage({Key? key}) : super(key: key);

  @override
  State<NumerosAleatoriosHivePage> createState() =>
      _NumerosAleatoriosPage();
}

class _NumerosAleatoriosPage
    extends State<NumerosAleatoriosHivePage> {
  //variáveis
  int numeroGerado = 0;
  int quantidadeCliques = 0;
  late Box boxNumerosAleatorios;
  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  //func carregarr
  void carregarDados() async {
    if(Hive.isBoxOpen('box_numeros_aleatorios')){
      boxNumerosAleatorios = Hive.box('box_numeros_aleatorios');
    } else {
      boxNumerosAleatorios = await Hive.openBox('box_numeros_aleatorios');

    }
    numeroGerado =  boxNumerosAleatorios.get('numeroGerado') ?? 0;
    quantidadeCliques =  boxNumerosAleatorios.get('quantidadeCliques') ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text("Hive")),
          body: Container(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        numeroGerado.toString(),
                        style: TextStyle(fontSize: 22)),
                    Text(
                        quantidadeCliques.toString(),
                        style: TextStyle(fontSize: 22))
                  ])),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async {
              // await storage.remove(CHAVE_NUMERO_ALEATORIO);
              var random = Random();
              setState(() {
                numeroGerado = random.nextInt(1000);
                quantidadeCliques = quantidadeCliques + 1;
              });
              boxNumerosAleatorios.put('numeroGerado',numeroGerado);
              boxNumerosAleatorios.put('quantidadeCliques',quantidadeCliques);
            },
          )),
    );
  }
}
