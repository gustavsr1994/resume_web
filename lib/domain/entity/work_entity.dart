import 'package:equatable/equatable.dart';

class WorkEntity extends Equatable {
  final String? job;
  final String? office;
  final String? period;
  const WorkEntity(
      {required this.job, required this.office, required this.period});

  @override
  List<Object?> get props => [
        job,
        office,
        period,
      ];
}
