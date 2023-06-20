import 'package:flutter/material.dart';
import 'package:school/components/spacer_component.dart';
import 'package:school/entidades/afazer_checklist_entity.dart';
import 'package:school/pages/home/components/item_widget.dart';
import 'package:school/pages/home/components/novo_item_widget.dart';

class AfazeresTab extends StatefulWidget {
  const AfazeresTab({
    super.key,
  });

  @override
  State<AfazeresTab> createState() => _AfazeresTabState();
}

class _AfazeresTabState extends State<AfazeresTab> {
  late List<AfazerCheckListEntity> _listAfazeres;

  void handleAdicionar() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              NovoItemWidget(
                callback: (item) {
                  _listAfazeres.add(item);
                  setState(() {
                    _listAfazeres = _listAfazeres;
                  });
                },
              ),
            ],
          );
        });
    // final item = (AfazerCheckListEntity(
    //   uuid: 'teste 3',
    //   titulo: 'teste 3',
    //   dataInicio: DateTime.now(),
    //   dataFim: DateTime.now(),
    //   isConcluido: false,
    // ));
    // _listAfazeres.add(item);

    // setState(() {
    //   _listAfazeres = _listAfazeres;
    // });
  }

  void handleExcluir(index) {
    _listAfazeres.removeAt(index);

    setState(() {
      _listAfazeres = _listAfazeres;
    });
  }

  @override
  void initState() {
    _listAfazeres = [
      AfazerCheckListEntity(
        uuid: 'testes1',
        titulo: 'testes1 ',
        dataInicio: DateTime.now(),
        dataFim: DateTime.now(),
        isConcluido: false,
      ),
      AfazerCheckListEntity(
        uuid: 'testes 2',
        titulo: 'testes 2 ',
        dataInicio: DateTime.now(),
        dataFim: DateTime.now(),
        isConcluido: true,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
            onPressed: handleAdicionar, child: const Text('Adcionar')),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: ListView.builder(
              itemCount: _listAfazeres.length,
              itemBuilder: (context, index) {
                final item = _listAfazeres.elementAt(index);
                return Dismissible(
                  key: Key(item.uuid),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      handleExcluir(index);
                    }
                  },
                  child: ItemWidget(
                    item: item,
                    onPressed: handleAdicionar,
                  ),
                );
              }),
        ),
        const SpacerComponent(),
      ],
    );
  }
}
