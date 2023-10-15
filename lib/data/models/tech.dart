import 'package:resume_web/domain/entity/tech_entity.dart';

class Tech extends TechEntity {
  const Tech({required super.name});

  factory Tech.fromJson(Map<String, dynamic> json) {
    return Tech(name: json['name']);
  }
}
