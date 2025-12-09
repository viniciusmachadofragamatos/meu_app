import 'package:flutter/material.dart';
import 'package:meu_app/model/dados_cadastrais_model.dart';
import 'package:meu_app/repositories/dados_cadastrais_repository.dart';
import 'package:meu_app/repositories/linguagens_repository.dart';
import 'package:meu_app/repositories/nivel_repository.dart';
import 'package:meu_app/shared/widgets/text_label.dart';
import 'package:intl/intl.dart';

class DadosCadastraisHivePage extends StatefulWidget {
  DadosCadastraisHivePage({super.key});

  @override
  State<DadosCadastraisHivePage> createState() =>
      _DadosCadastraisHivePageState();
}

class _DadosCadastraisHivePageState extends State<DadosCadastraisHivePage> {
  final nomeController = TextEditingController();
  final dataNascimentoController = TextEditingController();
  final linguagensRepository = LinguagensRepository();
  final nivelRepository = NivelRepository();
  var dadosCadastraisModel = DadosCadastraisModel.vazio();

  bool salvando = false;
  late DadosCadastraisRepository dadosCadastraisRepository;
  List<String> linguagens = [];
  List<String> niveis = [];

  @override
  void initState() {
    super.initState();
    niveis = nivelRepository.returnaNiveis();
    linguagens = linguagensRepository.retornaLinguagem();
    carregarDados();
  }

  carregarDados() async {
    dadosCadastraisRepository = await DadosCadastraisRepository.carregar();
    dadosCadastraisModel = dadosCadastraisRepository.obterDados();
    nomeController.text = dadosCadastraisModel.nome ?? "";
    dataNascimentoController.text = dadosCadastraisModel.dataNascimento == null
        ? ""
        : dadosCadastraisModel.dataNascimento.toString();
    setState(() {});
  }

  List<DropdownMenuItem<int>> returnItens(int quantidadeMaxima) {
    return List.generate(
      quantidadeMaxima,
      (i) => DropdownMenuItem(
        value: i,
        child: Text(i.toString(), style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dropdownMenuTheme: DropdownMenuThemeData(
          textStyle: const TextStyle(color: Colors.white),
          menuStyle: MenuStyle(
            backgroundColor: MaterialStatePropertyAll(
              const Color.fromARGB(255, 21, 52, 71),
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meus Dados"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: salvando
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    const TextLabel(texto: "Nome"),
                    TextField(controller: nomeController),
                    const SizedBox(height: 20),

                    const TextLabel(texto: "Data de Nascimento"),
                    TextField(
                      readOnly: true,
                      controller: dataNascimentoController,
                      onTap: () async {
                        var data = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2030),
                        );

                        if (data != null) {
                          setState(() {
                            dadosCadastraisModel.dataNascimento = data;
                            dataNascimentoController.text =
                                DateFormat("dd/MM/yyyy").format(data);
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 20),

                    const TextLabel(texto: "Nível de Experiência"),
                    Column(
                      children: niveis.map((nivel) {
                        return RadioListTile(
                          dense: true,
                          title: Text(
                            nivel,
                            style: const TextStyle(color: Colors.white),
                          ),
                          selected:
                              dadosCadastraisModel.nivelExperiencia == nivel,
                          value: nivel,
                          groupValue: dadosCadastraisModel.nivelExperiencia,
                          onChanged: (value) {
                            setState(() => dadosCadastraisModel
                                .nivelExperiencia = value.toString());
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),

                    const TextLabel(texto: "Linguagens Preferidas"),
                    Column(
                      children: linguagens.map((linguagem) {
                        return CheckboxListTile(
                          dense: true,
                          title: Text(
                            linguagem,
                            style: const TextStyle(color: Colors.white),
                          ),
                          value: dadosCadastraisModel.linguagens
                              .contains(linguagem),
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                dadosCadastraisModel.linguagens.add(linguagem);
                              } else {
                                dadosCadastraisModel.linguagens
                                    .remove(linguagem);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),

                    const TextLabel(texto: "Tempo de Experiência"),
                    DropdownButton(
                      value: dadosCadastraisModel.tempoExperiencia,
                      isExpanded: true,
                      dropdownColor:
                          const Color.fromARGB(255, 21, 52, 71), // extra
                      items: returnItens(21),
                      onChanged: (value) {
                        setState(() {
                          dadosCadastraisModel.tempoExperiencia =
                              value as int;
                        });
                      },
                    ),

                    TextLabel(
                      texto:
                          "Pretensão Salarial: R\$ ${dadosCadastraisModel.salario?.round()}",
                    ),
                    const SizedBox(height: 20),

                    Slider(
                      min: 0,
                      max: 10000,
                      value: dadosCadastraisModel.salario ?? 0,
                      onChanged: (value) {
                        setState(() => dadosCadastraisModel.salario = value);
                      },
                    ),

                    TextButton(
                      onPressed: () async {
                        if (nomeController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("O nome deve ser preenchido.")),
                          );
                          return;
                        }

                        if (dadosCadastraisModel.dataNascimento == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Data de nascimento inválida.")),
                          );
                          return;
                        }

                        if (dadosCadastraisModel.nivelExperiencia == null ||
                            dadosCadastraisModel.nivelExperiencia!.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Selecione um nível.")),
                          );
                          return;
                        }

                        if (dadosCadastraisModel.linguagens.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Selecione ao menos uma linguagem.")),
                          );
                          return;
                        }

                        if (dadosCadastraisModel.tempoExperiencia == null ||
                            dadosCadastraisModel.tempoExperiencia == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "É necessário ao menos 1 ano de experiência.")),
                          );
                          return;
                        }

                        if (dadosCadastraisModel.salario == null ||
                            dadosCadastraisModel.salario == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "A pretensão salarial deve ser maior que zero.")),
                          );
                          return;
                        }

                        dadosCadastraisModel.nome = nomeController.text;

                        setState(() => salvando = true);

                        await dadosCadastraisRepository
                            .salvar(dadosCadastraisModel);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Salvo com sucesso!")),
                        );

                        if (mounted) {
                          setState(() => salvando = false);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Salvar"),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
