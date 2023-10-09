import 'package:resume_web/core/error/failure.dart';
import 'package:resume_web/core/utils/multipe_result.dart';
import 'package:resume_web/domain/entity/profile_entity.dart';

abstract class ProfileRepository {
  Future<Result<Failure, ProfileEntity>> dataProfile();
}
