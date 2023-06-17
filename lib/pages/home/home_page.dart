import 'package:flutter/material.dart';
import 'package:school/components/app_bar_component.dart';
import 'package:school/pages/home/abas/afazeres_tab.dart';
import 'package:school/pages/home/abas/perfil_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int index;

  void updateIndex(int value) {
    setState(() {
      index = value;
    });
  }

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> _abas = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.account_circle), label: 'Perfil')
    ];
    final List<Widget> _conteudo = [
      const AfazeresTab(),
      // AfazeresTab(valorInicial: 5, callback: updateIndex),
      const PerfilTab(),
    ];
    return Scaffold(
      appBar: AppBarComponent(),
      body: _conteudo.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          updateIndex(value);
        },
        currentIndex: index,
        items: _abas,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
