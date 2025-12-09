import 'package:flutter/material.dart';
import 'package:meu_app/pages/configuracoes/configuracoes_hive_page.dart';
import 'package:meu_app/pages/login_page.dart';
import 'package:meu_app/pages/numeros_aleatorios/numeros_aleatorios_hive_page.dart';
import 'package:meu_app/pages/dados_cadastrais/dados_cadastrais_hive.dart';
import 'package:meu_app/shared/app_images.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF153447),  
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: [

          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 86, 213, 124),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color.fromARGB(255, 63, 148, 187),
                  child: ClipOval(
                    child: Image.asset(
                      AppImages.logo,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vinicius Machado",
                      style: TextStyle(
                        color: Color(0xFF153447),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "email@email.com",
                      style: TextStyle(
                        color: Color(0xFF153447),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          _drawerItem(
            icon: Icons.person,
            text: "Dados cadastrais",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DadosCadastraisHivePage(),
                ),
              );
            },
          ),

          const Divider(color: Colors.white54),

          _drawerItem(
            icon: Icons.settings,
            text: "Configurações",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (bc) => const ConfiguracoesHivePage(),
                ),
              );
            },
          ),

          const Divider(color: Colors.white54),

          _drawerItem(
            icon: Icons.info,
            text: "Termos de uso e privacidade",
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: const Color(0xFF153447),
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      "Podemos já vislumbrar o modo pelo qual a contínua "
                      "expansão de nossa atividade agrega valor ao "
                      "estabelecimento das condições inegavelmente apropriadas.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  );
                },
              );
            },
          ),

          const Divider(color: Colors.white54),

          _drawerItem(
            icon: Icons.exit_to_app,
            text: "Sair",
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    backgroundColor: const Color(0xFF153447),
                    title: const Text(
                      "Meu App",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: const Text(
                      "Você sairá do aplicativo.\nDeseja realmente sair?",
                      style: TextStyle(color: Colors.white),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Não", style: TextStyle(color: Colors.white)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: const Text("Sim", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  );
                },
              );
            },
          ),

          const Divider(color: Colors.white54),

          _drawerItem(
            icon: Icons.numbers,
            text: "Gerador de número aleatório",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (bc) => const NumerosAleatoriosHivePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
