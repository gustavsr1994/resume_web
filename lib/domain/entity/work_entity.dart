import 'package:equatable/equatable.dart';
import 'package:resume_web/data/models/work.dart';

class WorkEntity extends Equatable {
  final String? job;
  final String? office;
  final String? period;
  final List<Responsible> listResponsible;
  const WorkEntity(
      {required this.job,
      required this.office,
      required this.period,
      required this.listResponsible});

  @override
  List<Object?> get props => [
        job,
        office,
        period,
        listResponsible,
      ];
}

class ResponsibleEntity extends Equatable {
  final String? data;
  const ResponsibleEntity({this.data});

  @override
  List<Object?> get props => [data];
}
