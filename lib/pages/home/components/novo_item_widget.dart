import 'package:flutter/material.dart';
import 'package:school/components/icon_button_component.dart';
import 'package:school/components/spacer_component.dart';
import 'package:school/entidades/afazer_entity.dart';
import 'package:school/entidades/afazer_checklist_entity.dart';

class NovoItemWidget extends StatefulWidget {
  final void Function(AfazerEntity item) callback;

  const NovoItemWidget({
    super.key,
    required this.callback,
  });

  @override
  State<NovoItemWidget> createState() => _NovoItemWidgetState();
}

enum Tipolista { lembrete, tarefa }

class _NovoItemWidgetState extends State<NovoItemWidget> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyTarefas = GlobalKey<FormState>();

  final _titleController = TextEditingController();

  List<TextEditingController> itens = [];
  Tipolista dropdownValue = Tipolista.lembrete;

  Widget defaultCheckItem(TextEditingController controller) {
    return CheckboxListTile(
      title: TextFormField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Digite '),
        validator: (value) {
          return (value == null || value.isEmpty)
              ? 'Por favor digite um valor'
              : null;
        },
      ),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: const EdgeInsets.all(0),
      value: false,
      onChanged: null,
    );
  }

  void handleSubmit() {
    final isValido = _formKey.currentState!.validate();
    if (isValido) {
      final item = AfazerEntity(
        uuid: 'xpto',
        titulo: _titleController.text,
        dataInicio: DateTime.now(),
        dataFim: DateTime.now(),
        conteudos: [],
      );

      bool valid = false;
      if (dropdownValue == Tipolista.tarefa) {
        final isTarefasValidas = _formKeyTarefas.currentState!.validate();
        if (isTarefasValidas) {
          valid = true;
          for (final value in itens) {
            item.conteudos!.add(AfazerChecklistEntity(titulo: value.text));
          }
        }
      } else {
        valid = true;
      }

      if (valid) {
        widget.callback(item);
        Navigator.pop(context);
      }
    }
  }

  void addItem() {
    if (dropdownValue == Tipolista.tarefa) {
      itens.add(TextEditingController());
      setState(() {
        itens = itens;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _titleController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        Row(
          children: [
            const Text(
              'Tipo de Lista',
              style: TextStyle(fontSize: 10),
            ),
            const SpacerComponent(
              isFull: true,
            ),
            DropdownButton(
              value: dropdownValue,
              items: const [
                DropdownMenuItem(
                  value: Tipolista.lembrete,
                  child: Text('Lembrete'),
                ),
                DropdownMenuItem(
                  value: Tipolista.tarefa,
                  child: Text('Tarefas'),
                )
              ],
              onChanged: (value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
            ),
          ],
        ),
        TextFormField(
          controller: _titleController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor digite um nome';
            }
            return null;
          },
        ),
        const SpacerComponent(),
        if (dropdownValue == Tipolista.tarefa)
          Row(
            children: [
              const Text('Lista'),
              const SpacerComponent(
                isFull: true,
              ),
              IconButtonComponent(
                  onPressed: addItem, iconSize: 16, icon: Icons.add),
            ],
          ),
        if (dropdownValue == Tipolista.tarefa)
          Form(
              key: _formKeyTarefas,
              child: Column(
                children: itens.map(defaultCheckItem).toList(),
              )),
        const SpacerComponent(),
        ElevatedButton(onPressed: handleSubmit, child: const Text('Cadastrar'))
      ]),
    );
  }
}
