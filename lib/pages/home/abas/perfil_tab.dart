import 'package:flutter/material.dart';
import 'package:school/components/icon_button_component.dart';
import 'package:school/components/spacer_component.dart';

class PerfilTab extends StatelessWidget {
  const PerfilTab({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Row(
              children: [Icon(Icons.list), Text('Total de notas: 0')],
            ),
            const SpacerComponent(),
            const Row(
              children: [Icon(Icons.check), Text('Concluidas: 0')],
            ),
            const SpacerComponent(),
            const Divider(),
            const SpacerComponent(),
            const Text("Configurações"),
            const SpacerComponent(),
            Row(
              children: [
                const Text('Tema escuro'),
                const SpacerComponent(
                  isFull: true,
                ),
                Switch(value: true, onChanged: (value) {}),
              ],
            )
          ]),
    );
  }
}
