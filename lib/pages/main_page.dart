import 'package:flutter/material.dart';
import 'package:meu_app/pages/card_page.dart';
import 'package:meu_app/pages/image_assets.dart';
import 'package:meu_app/pages/list_view.dart';
import 'package:meu_app/pages/list_view_horizontal.dart';
import 'package:meu_app/pages/tarefa_page/tarefa_hive_page.dart';
import 'package:meu_app/shared/widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController controller = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Main Page"),
          centerTitle: true,
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                children: [
                  const CardPage(),
                  const ImageAssetsPage(),
                  const ListViewPage(),
                  const ListViewHorizontal(),
                  TarefaPage(),
                ],
              ),
            ),

            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentPage,
              onTap: (index) {
                controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
              items: const [
                BottomNavigationBarItem(
                  label: "Cards",
                  icon: Icon(Icons.credit_card),
                ),
                BottomNavigationBarItem(
                  label: "Images",
                  icon: Icon(Icons.image),
                ),
                BottomNavigationBarItem(
                  label: "List",
                  icon: Icon(Icons.list_alt),
                ),
                BottomNavigationBarItem(
                  label: "Horizontal",
                  icon: Icon(Icons.view_carousel),
                ),
                BottomNavigationBarItem(
                  label: "Tasks",
                  icon: Icon(Icons.task_alt),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
