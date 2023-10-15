import 'package:resume_web/domain/entity/education_entity.dart';

class Education extends EducationEntity {
  const Education(
      {required super.name, required super.major, required super.point});

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
        name: json["name"], major: json["major"], point: json["point"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['major'] = major;
    data['name'] = name;
    data['point'] = point;
    return data;
  }
}
