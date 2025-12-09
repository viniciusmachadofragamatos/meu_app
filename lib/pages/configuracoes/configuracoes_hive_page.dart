import 'package:flutter/material.dart';
import 'package:meu_app/model/configuracoes_model.dart';
import 'package:meu_app/repositories/configuracoes_repository.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({super.key});

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {
  late ConfiguracoesRepository configuracoesRepository;
  ConfiguracoesModel configuracoesModel = ConfiguracoesModel.vazio();
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();

    nomeUsuarioController.text = configuracoesModel.nomeUsuario;
    alturaController.text = configuracoesModel.altura.toString();


    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Configurações Hive")),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: nomeUsuarioController,
                decoration: InputDecoration(hintText: "Nome Usuário"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: alturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Altura"),
              ),
            ),
            SwitchListTile(
              title: Text("Receber Notificações", style: TextStyle(color: Colors.white),),
              value: configuracoesModel.receberNotificacoes,
              onChanged: (value) {
                setState(() => configuracoesModel.receberNotificacoes = value);
              },
            ),
            SwitchListTile(
              title: Text("Tema escuro", style: TextStyle(color: Colors.white),),
              value: configuracoesModel.temaEscuro,
              onChanged: (value) {
                setState(() => configuracoesModel.temaEscuro = value);
              },
            ),
            TextButton(
              child: Text("Salvar"),
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();

                final model = ConfiguracoesModel(
                  nomeUsuarioController.text,
                  double.tryParse(alturaController.text) ?? 0,
                  configuracoesModel.receberNotificacoes,
                  configuracoesModel.temaEscuro,
                );

                configuracoesRepository.salvar(model);

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
