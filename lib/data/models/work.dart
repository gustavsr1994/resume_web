import 'package:resume_web/domain/entity/work_entity.dart';

class Work extends WorkEntity {
  Work({required super.job, required super.office, required super.period});

  factory Work.fromJson(Map<String, dynamic> json) {
    return Work(
      job: json['job'],
      office: json['office'],
      period: json['period'],
    );
  }
}
