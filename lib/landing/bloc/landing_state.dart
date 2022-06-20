import 'package:equatable/equatable.dart';

enum UserMode { none, brandNew, existing }

class LandingState extends Equatable {
  const LandingState({this.userMode = UserMode.none});

  final UserMode userMode;

  @override
  List<Object> get props => [userMode];
}
