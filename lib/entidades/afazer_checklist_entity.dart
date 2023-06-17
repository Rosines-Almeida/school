import 'package:school/entidades/afazer_entity.dart';

class AfazerCheckListEntity {
  final String uuid;
  final String titulo;
  final DateTime dataInicio;
  final DateTime dataFim;
  final bool isConcluido;
  final List<AfazerEntity?>? conteudo;
  String? image;

  AfazerCheckListEntity({
    required this.uuid,
    required this.titulo,
    required this.dataInicio,
    required this.dataFim,
    required this.isConcluido,
    this.conteudo,
    this.image,
  });
}
