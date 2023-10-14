part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {
  ProfileInitial();
}

class ProfileSuccess extends ProfileState {
  final ProfileEntity dataEntity;
  final String urlPhoto;
  ProfileSuccess({required this.dataEntity, required this.urlPhoto});

  @override
  List<Object> get props => [dataEntity, urlPhoto];
}

class ProfileNoData extends ProfileState {
  ProfileNoData();
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError({required this.message});

  @override
  List<Object> get props => [message];
}
