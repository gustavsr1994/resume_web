import 'package:equatable/equatable.dart';
import 'package:resume_web/data/models/education.dart';
import 'package:resume_web/data/models/socmed.dart';
import 'package:resume_web/data/models/tech.dart';
import 'package:resume_web/data/models/work.dart';

class ProfileEntity extends Equatable {
  final String desc;
  final Education education;
  final String name;
  final List<Socmed> socmed;
  final List<Tech> listTech;
  final List<Work> listWork;
  const ProfileEntity({
    required this.name,
    required this.desc,
    required this.education,
    required this.socmed,
    required this.listTech,
    required this.listWork,
  });
  @override
  List<Object?> get props => [
        name,
        desc,
        education,
        socmed,
        listTech,
        listWork,
      ];
}
