import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:meu_app/model/tarefa.dart';
import 'package:meu_app/model/tarefa_hive_model.dart';
import 'package:meu_app/repositories/tarefa_hive_repository.dart';
// ignore: unused_import
import 'package:meu_app/repositories/tarefa_repository.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});
  @override
  State<TarefaPage> createState() => _TarefaPageState();
}
class _TarefaPageState extends State<TarefaPage> {
  late TarefaHiveRepository tarefaRepository;
  List<TarefaHiveModel> _tarefas = [];
  final descricaoController = TextEditingController();

  bool apenasNaoConcluidos = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  @override
  void dispose() {
    descricaoController.dispose();
    super.dispose();
  }

  Future<void> obterTarefas() async {
    tarefaRepository = await TarefaHiveRepository.carregar();
     _tarefas = await tarefaRepository.obterDados(apenasNaoConcluidos);
    setState(() {});
  }
  void _abrirDialogNovaTarefa() {
    descricaoController.clear();
    showDialog(
      context: context,
      builder: (BuildContext bc) {
        return AlertDialog(
          title: const Text("Adicionar Tarefa"),
          content: TextField(
            controller: descricaoController,
            decoration: const InputDecoration(
              labelText: "Descrição",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () async {
                if (descricaoController.text.trim().isEmpty) return;

                await tarefaRepository.salvar(
                  TarefaHiveModel.criar(descricaoController.text.trim(), false),
                );

                Navigator.pop(context);

                await obterTarefas(); // RECARREGA A LISTA DE VERDADE
              },
              child: const Text("Salvar"),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirDialogNovaTarefa,
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Exibir apenas não concluídas",
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: apenasNaoConcluidos,
                  onChanged: (value) {
                    apenasNaoConcluidos = value;
                    obterTarefas();
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (context, index) {
                  final tarefa = _tarefas[index];
                  return Dismissible(
                    key: ValueKey("${tarefa.key}-$index"),
                    direction: DismissDirection.startToEnd,
                    background: Container(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) async {
                      tarefaRepository.excluir(tarefa);
                      await obterTarefas();
                    },
                    child: ListTile(
                      textColor: Colors.white,
                      title: Text(tarefa.descricao),
                      trailing: Switch(
                        value: tarefa.concluido,
                        onChanged: (value) async {
                          tarefa.concluido = value;
                          tarefaRepository.alterar(tarefa);
                          await obterTarefas();
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
