import 'package:resume_web/core/error/failure.dart';
import 'package:resume_web/core/utils/multipe_result.dart';

abstract class UseCase<Output, Input> {
  Future<Result<Failure, Output?>> call(Input input);
}
