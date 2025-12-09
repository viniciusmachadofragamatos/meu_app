import 'package:flutter/material.dart';
import 'package:meu_app/shared/app_images.dart';

class ListViewHorizontal extends StatefulWidget {
  const ListViewHorizontal({super.key});

  @override
  State<ListViewHorizontal> createState() => _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<ListViewHorizontal> {
  final imagens = [
    AppImages.paisagem1,
    AppImages.paisagem2,
    AppImages.paisagem3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imagens.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    elevation: 8,
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      imagens[index],
                      width: 200,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                "Conteúdo inferior aqui",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
