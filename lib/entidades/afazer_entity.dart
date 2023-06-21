import 'package:school/entidades/afazer_checklist_entity.dart';

class AfazerEntity {
  final String uuid;
  final String titulo;
  final DateTime dataInicio;
  final DateTime dataFim;
  final bool? isConcluido;
  final List<AfazerChecklistEntity?>? conteudos;
  String? image;

  AfazerEntity({
    required this.uuid,
    required this.titulo,
    required this.dataInicio,
    required this.dataFim,
    this.isConcluido,
    this.conteudos,
    this.image,
  });
}
