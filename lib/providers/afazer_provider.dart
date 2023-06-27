import 'package:flutter/material.dart';
import 'package:school/entidades/afazer_entity.dart';
import 'package:school/pages/home/components/novo_item_widget.dart';
import 'package:school/services/afazer_service.dart';

class AfazerProvider with ChangeNotifier {
  final service = AfazerService();
  List<AfazerEntity> _listAfazeres = [];

  AfazerEntity? _selecionado;

  AfazerProvider() {
    buscarAfazeres();
  }
  buscarAfazeres() async {
    listaAfazeres = await service.buscar();
  }

  List<AfazerEntity> get listaAfazeres {
    return _listAfazeres;
  }

  set selecionado(AfazerEntity? val) {
    _selecionado = val;
    notifyListeners();
  }

  AfazerEntity? get selecionado => _selecionado;

  void atualizarItemAfazer(int index) {
    if (selecionado != null) {
      _listAfazeres[index] = selecionado!;
      notifyListeners();
    }
  }

  set listaAfazeres(List<AfazerEntity> value) {
    _listAfazeres = value;
    service.salvar(_listAfazeres);
    notifyListeners();
  }

  void removerItemAfazer(int index) {
    listaAfazeres.removeAt(index);
    service.salvar(listaAfazeres);
    notifyListeners();

    // setState(() {
    //   _listAfazeres = _listAfazeres;
    // });
  }

  void abrirModalCadastro(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              NovoItemWidget(
                callback: (item) {
                  //desesturando desta forma o nov item adcionad fica na frente
                  listaAfazeres = [item, ...listaAfazeres];
                },
              ),
            ],
          );
        });
  }
}
