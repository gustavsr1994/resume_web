import 'package:resume_web/domain/entity/work_entity.dart';

class Work extends WorkEntity {
  const Work(
      {required super.job,
      required super.office,
      required super.period,
      required super.listResponsible});

  factory Work.fromJson(Map<String, dynamic> json) {
    var responsible = <Responsible>[];
    if (json['responsible'] != null) {
      json['responsible'].forEach((v) {
        responsible.add(Responsible.fromJson(v));
      });
    }
    return Work(
        job: json['job'],
        office: json['office'],
        period: json['period'],
        listResponsible: responsible);
  }
}

class Responsible extends ResponsibleEntity {
  const Responsible({
    required super.data,
  });
  factory Responsible.fromJson(Map<String, dynamic> json) {
    return Responsible(data: json['data']);
  }
}
