import 'package:equatable/equatable.dart';

class SocmedEntity extends Equatable {
  final String icon;
  final String name;
  final String link;

  const SocmedEntity(
      {required this.icon, required this.name, required this.link});

  @override
  List<Object?> get props => [icon, name, link];
}
