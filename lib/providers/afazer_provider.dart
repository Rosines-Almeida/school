import 'package:flutter/material.dart';
import 'package:school/entidades/afazer_entity.dart';
import 'package:school/services/afazer_service.dart';

class AfazerProvider with ChangeNotifier {
  final service = AfazerService();
  List<AfazerEntity> _listAfazeres = [];

  AfazerProvider() {
    buscarAfazeres();
  }
  buscarAfazeres() async {
    listaAfazeres = await service.buscar();
  }

  List<AfazerEntity> get listaAfazeres => _listAfazeres;

  set listaAfazeres(List<AfazerEntity> value) {
    _listAfazeres = value;
    notifyListeners();
  }
}
