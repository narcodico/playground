part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState(this.result);

  final String result;

  @override
  List<Object> get props => [result];
}
