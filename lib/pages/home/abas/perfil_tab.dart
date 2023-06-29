import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school/components/icon_button_component.dart';
import 'package:school/components/spacer_component.dart';
import 'package:school/providers/afazer_provider.dart';
import 'package:school/providers/config_provider.dart';

class PerfilTab extends StatefulWidget {
  const PerfilTab({super.key});

  @override
  State<PerfilTab> createState() => _PerfilTabState();
}

class _PerfilTabState extends State<PerfilTab> {
  late AfazerProvider store;
  late ConfigProvider storeConfig;

  @override
  Widget build(BuildContext context) {
    store = Provider.of<AfazerProvider>(context);
    storeConfig = Provider.of<ConfigProvider>(context);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.all(0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    const CircleAvatar(
                      child: Text('R'),
                    ),
                    const SpacerComponent(isHorizontal: true, size: 8),
                    const Text(
                      'Rosi',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SpacerComponent(
                      isFull: true,
                    ),
                    IconButtonComponent(
                      onPressed: () {},
                      icon: Icons.more_vert,
                    )
                  ],
                ),
              ),
            ),
            const SpacerComponent(),
            const Divider(),
            const Text('Minhas estatisticas'),
            const SpacerComponent(),
            Row(
              children: [
                const Icon(Icons.list),
                const SizedBox(width: 8),
                const Text('Total de notas:'),
                Text(store.listaAfazeres.length.toString()),
              ],
            ),
            const SpacerComponent(),
            Row(
              children: [
                const Icon(Icons.list),
                const SizedBox(width: 8),
                const Text('Concluidas: '),
                Text(store.listaAfazeres
                    .where((element) => element.isConcluido == true)
                    .length
                    .toString()),
              ],
            ),
            const SpacerComponent(),
            const SpacerComponent(isHorizontal: true, isFull: true),
            const SpacerComponent(),
            const Text(
              'Minhas estatísticas',
              style: TextStyle(fontSize: 18),
            ),
            const SpacerComponent(),
            Row(
              children: [
                const Text('Tema escuro'),
                const SpacerComponent(
                  isHorizontal: true,
                ),
                Switch(
                  value: storeConfig.tema == ThemeMode.dark,
                  onChanged: (val) {
                    storeConfig.tema = val ? ThemeMode.dark : ThemeMode.light;
                  },
                ),
              ],
            )
          ]),
    );
  }
}
