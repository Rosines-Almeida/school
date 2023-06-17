import 'package:flutter/material.dart';
import 'package:school/components/spacer_component.dart';
import 'package:school/entidades/afazer_checklist_entity.dart';

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
    final item = (AfazerCheckListEntity(
      uuid: 'teste 3',
      titulo: 'teste 3',
      dataInicio: DateTime.now(),
      dataFim: DateTime.now(),
      isConcluido: false,
    ));
    _listAfazeres.add(item);

    setState(() {
      _listAfazeres = _listAfazeres;
    });
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
                return SizedBox(
                  height: 50,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              item.isConcluido
                                  ? const Icon(
                                      Icons.done_all,
                                      color: Colors.green,
                                    )
                                  : const Icon(
                                      Icons.done,
                                      color: Colors.green,
                                    ),
                              const SpacerComponent(
                                isHorizontal: true,
                              ),
                              Dismissible(
                                  key: Key(item.uuid),
                                  child: Text(item.titulo),
                                  onDismissed: (direction) {
                                    if (direction ==
                                        DismissDirection.startToEnd) {
                                      handleExcluir(index);
                                    }
                                  }),
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ),
                );
                // return Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(item.titulo),
                //     IconButton(
                //         onPressed: () => handleExcluir(index),
                //         icon: const Icon(Icons.remove)),
                //     const SpacerComponent(
                //       size: 5,
                //     ),
                //   ],
                // );
              }),
        ),
        const SpacerComponent(),
      ],
    );
  }
}
