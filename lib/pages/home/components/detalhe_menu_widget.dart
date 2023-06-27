// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:school/components/icon_button_component.dart';
import 'package:school/components/spacer_component.dart';

import 'package:school/entidades/afazer_entity.dart';

class DetalheMenuWidget extends StatelessWidget {
  final AfazerEntity item;
  final Function() onDone;
  final Function() onDelete;
  const DetalheMenuWidget({
    Key? key,
    required this.item,
    required this.onDone,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (item.conteudos.isNotEmpty)
          const Text(
            'Tarefas',
            style: TextStyle(fontSize: 24),
          ),
        const SpacerComponent(
          isFull: true,
        ),
        IconButtonComponent(
          onPressed: onDone,
          iconSize: 18,
          color: (item.isConcluido == true) ? Colors.green : null,
          icon: (item.isConcluido == true) ? Icons.done_all : Icons.done,
        ),
        IconButtonComponent(
          onPressed: onDelete,
          iconSize: 18,
          color: Colors.red,
          icon: Icons.delete_forever,
        )
      ],
    );
  }
}
