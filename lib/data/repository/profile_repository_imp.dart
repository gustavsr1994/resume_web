import 'package:resume_web/core/error/exceptions.dart';
import 'package:resume_web/core/error/failure.dart';
import 'package:resume_web/core/utils/multipe_result.dart';
import 'package:resume_web/data/source/profile_datasource.dart';
import 'package:resume_web/domain/entity/profile_entity.dart';
import 'package:resume_web/domain/repository/profile_repository.dart';

class ProfileRepositoryImp implements ProfileRepository {
  final ProfileDatasource dataSource;
  ProfileRepositoryImp({required this.dataSource});

  @override
  Future<Result<Failure, ProfileEntity>> dataProfile() async {
    try {
      final result = await dataSource.getProfile();
      return Success(result);
    } on ServerException catch (error) {
      return Error(ServerFailure(error.message));
    }
  }

  @override
  Future<Result<Failure, String>> getUrlPhoto() async {
    try {
      final result = await dataSource.getPhotoProfile();
      return Success(result);
    } on ServerException catch (error) {
      return Error(ServerFailure(error.message));
    }
  }
}
