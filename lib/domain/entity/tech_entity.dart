import 'package:equatable/equatable.dart';

class TechEntity extends Equatable {
  final String name;
  const TechEntity({required this.name});

  @override
  List<Object?> get props => [name];
}
