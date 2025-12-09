import 'package:flutter/material.dart';
import 'package:meu_app/shared/app_images.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(AppImages.user2),
              radius: 25,
            ),
            title: Text("Usuário 2"),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Olá, tudo bem?"),
                Text("08:59", style: TextStyle(fontSize: 12)),
              ],
            ),
            trailing: PopupMenuButton<String>(
              onSelected: (menu) {
                if (menu == "opcao2") {
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(value: "opcao1", child: Text("Opção 1")),
                PopupMenuItem(value: "opcao2", child: Text("Opção 2")),
                PopupMenuItem(value: "opcao3", child: Text("Opção 3")),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _buildImage(AppImages.user1),
          _buildImage(AppImages.user2),
          _buildImage(AppImages.user3),
          _buildImage(AppImages.paisagem1),
          _buildImage(AppImages.paisagem2),
          _buildImage(AppImages.paisagem3),
        ],
      ),
    );
  }
  Widget _buildImage(String asset) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          asset,
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
