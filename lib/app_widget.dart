import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School',
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      child: Text('R'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Rosi',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.more_vert)),


                  ],
                ),
                const Divider(),
                const Text('Minhas estatisticas'),
                const Row(
                  children: [Icon(Icons.list), Text('Total de notas: 0')],
                ),
                const Row(
                  children: [Icon(Icons.check), Text('Concluidas: 0')],
                ),
                const Divider(),
                const Text("Configurações"),
                Row(
                  children: [
                    const Text('Tema escuro'),
                    const Spacer(),
                    Switch(value: true, onChanged: (value) {}),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
