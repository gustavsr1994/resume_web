import 'package:equatable/equatable.dart';
import 'package:resume_web/data/models/profile.dart';

class ProfileEntity extends Equatable {
  final String desc;
  final Education education;
  final String name;
  const ProfileEntity(
      {required this.name, required this.desc, required this.education});
  @override
  List<Object?> get props => [name, desc, education];
}
