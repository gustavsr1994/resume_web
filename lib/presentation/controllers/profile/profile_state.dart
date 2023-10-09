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
  ProfileSuccess({required this.dataEntity});

  @override
  List<Object> get props => [dataEntity];
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
