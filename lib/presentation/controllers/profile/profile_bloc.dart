import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resume_web/core/error/failure.dart';
import 'package:resume_web/data/repository/profile_repository_imp.dart';
import 'package:resume_web/data/source/profile_datasource.dart';
import 'package:resume_web/domain/entity/profile_entity.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfile>((event, emit) async {
      final result =
          await ProfieRepositoryImp(dataSource: ProfileDataSourceImp())
              .dataProfile();
      if (result.isSuccess()) {
        emit(ProfileSuccess(dataEntity: result.getSuccess()!));
      } else {
        if (result.getError() is ServerFailure) {
          emit(ProfileError(message: result.getError()!.message));
        }
      }
    });
  }
}
