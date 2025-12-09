import 'package:flutter/material.dart';
import 'package:meu_app/services/app_storage_service.dart';

class ConfiguracoesSharedPreferencesPage extends StatefulWidget {
  const ConfiguracoesSharedPreferencesPage({super.key});

  @override
  State<ConfiguracoesSharedPreferencesPage> createState() =>
      _ConfiguracoesSharedPreferencesPageState();
}

class _ConfiguracoesSharedPreferencesPageState
    extends State<ConfiguracoesSharedPreferencesPage> {
  AppStorageService storage = AppStorageService();
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    alturaController.text = await storage.getConfiguracoesAltura().toString();
    nomeUsuarioController.text = await storage.getConfiguracoesNomeUsuario();
    receberNotificacoes = await storage.getConfiguracoesReceberNotificacoes();
    temaEscuro = await storage.getConfiguracoesTemaEscuro();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Configurações")),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextField(
                decoration: InputDecoration(hintText: "Nome Usuário"),
                controller: nomeUsuarioController,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Altura",
                ),
                controller: alturaController,
              ),
            ),
            SwitchListTile(
                title: Text("Receber Notificações"),
                value: receberNotificacoes,
                onChanged: (bool value) {
                  setState(() {
                    receberNotificacoes = value;
                  });
                }),
            SwitchListTile(
                title: Text("Tema escuro"),
                value: temaEscuro,
                onChanged: (bool value) {
                  setState(() {
                    temaEscuro = value;
                  });
                }),
            TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    await storage.setConfiguracoesAltura(
                        double.tryParse(alturaController.text) ?? 0);
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text("Meu app"),
                            content: Text("Favor informar uma altura válida"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("OK"))
                            ],
                          );
                        });
                    return;
                  }
                  await storage
                      .setConfiguracoesNomeUsuario(nomeUsuarioController.text);
                  await storage
                      .setConfiguracoesReceberNotificacoes(receberNotificacoes);
                  await storage.setConfiguracoesTemaEscuro(temaEscuro);
                  Navigator.pop(context);
                },
                child: Text("Salvar"))
          ],
        ),
      ),
    ));
  }
}
