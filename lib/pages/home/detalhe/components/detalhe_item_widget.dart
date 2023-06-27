import 'package:flutter/material.dart';
import 'package:school/entidades/afazer_checklist_entity.dart';

class DetalheItemWidget extends StatelessWidget {
  final AfazerChecklistEntity? item;
  final Function(bool? val) onChanged;
  const DetalheItemWidget({
    super.key,
    required this.item,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CheckboxListTile(
        value: item?.isChecked,
        onChanged: onChanged,
        title: Text(item?.titulo ?? 'sem titulo'),
        contentPadding: const EdgeInsets.all(0),
        //ajuda no alinhamento
        controlAffinity: ListTileControlAffinity.leading,
      )
    ]);
  }
}
