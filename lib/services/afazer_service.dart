import 'dart:convert';

import 'package:school/entidades/afazer_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AfazerService {
  final _keyAfazer = 'KEY_AFAZER';
  Future<void> salvar(List<AfazerEntity> item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String listJson = jsonEncode(item);

    await prefs.setString(_keyAfazer, listJson);
  }

  Future<List<AfazerEntity>> buscar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? listJson = prefs.getString(_keyAfazer);

    if (listJson != null) {
      return AfazerEntity.fromJsonList(jsonDecode(listJson));
    }
    return [];
  }
}
