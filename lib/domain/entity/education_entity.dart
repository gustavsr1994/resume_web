import 'package:equatable/equatable.dart';

class EducationEntity extends Equatable {
  final String name;
  final String major;
  final double point;

  const EducationEntity(
      {required this.name, required this.major, required this.point});
  @override
  List<Object?> get props => [
        name,
        major,
        point,
      ];
}
