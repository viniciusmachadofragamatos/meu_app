import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meu_app/services/app_storage_service.dart';

class NumerosAleatoriosSharedPreferencesPage extends StatefulWidget {
  const NumerosAleatoriosSharedPreferencesPage({Key? key}) : super(key: key);

  @override
  State<NumerosAleatoriosSharedPreferencesPage> createState() =>
      _NumerosAleatoriosPage();
}

class _NumerosAleatoriosPage
    extends State<NumerosAleatoriosSharedPreferencesPage> {
  //variáveis
  int numeroGerado = 0;
  int quantidadeCliques = 0;
  AppStorageService storage = AppStorageService();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  //func carregarr
  void carregarDados() async {
    numeroGerado = await storage.getNumeroAleatorio();
    quantidadeCliques = await storage.getQuantidadeCliques();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text("Gerador de números aleatórios")),
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
              storage.setNumeroAleatorio(numeroGerado);
              storage.setQuantidadeCliques(quantidadeCliques);
            },
          )),
    );
  }
}
