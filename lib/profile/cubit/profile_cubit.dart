import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:playground/repository/repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.repository, {this.initialState})
      : super(initialState ?? ProfileState(''));

  final ProfileState? initialState;
  final Repository repository;

  void fetch() {
    emit(ProfileState(repository.url));
  }
}
