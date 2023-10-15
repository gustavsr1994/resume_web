import 'package:resume_web/domain/entity/socmed_entity.dart';

class Socmed extends SocmedEntity {
  const Socmed({required super.icon, required super.name, required super.link});

  factory Socmed.fromJson(Map<String, dynamic> json) {
    return Socmed(icon: json['icon'], name: json['name'], link: json['link']);
  }
}
