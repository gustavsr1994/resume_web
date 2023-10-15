import 'package:resume_web/data/models/education.dart';
import 'package:resume_web/data/models/socmed.dart';
import 'package:resume_web/data/models/tech.dart';
import 'package:resume_web/data/models/work.dart';
import 'package:resume_web/domain/entity/profile_entity.dart';

class Profile extends ProfileEntity {
  const Profile(
      {required super.name,
      required super.desc,
      required super.education,
      required super.socmed,
      required super.listTech,
      required super.listWork});

  factory Profile.fromJson(Map<String, dynamic> json) {
    var tech = <Tech>[];
    if (json['tech'] != null) {
      json['tech'].forEach((v) {
        tech.add(Tech.fromJson(v));
      });
    }
    var work = <Work>[];
    if (json['work'] != null) {
      json['work'].forEach((v) {
        work.add(Work.fromJson(v));
      });
    }
    var socmed = <Socmed>[];
    if (json['socmed'] != null) {
      json['socmed'].forEach((v) {
        socmed.add(Socmed.fromJson(v));
      });
    }
    return Profile(
      name: json["name"],
      desc: json["desc"],
      education: Education.fromJson(json["education"]),
      socmed: socmed,
      listTech: tech,
      listWork: work,
    );
  }
}
