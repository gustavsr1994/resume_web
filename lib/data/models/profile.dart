import 'package:resume_web/domain/entity/education_entity.dart';
import 'package:resume_web/domain/entity/profile_entity.dart';

class Profile extends ProfileEntity {
  Profile({required super.name, required super.desc, required super.education});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        name: json["name"],
        desc: json["desc"],
        education: Education.fromJson(json["education"]));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = desc;
    data['education'] = education.toJson();
    data['name'] = name;

    return data;
  }
}

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
