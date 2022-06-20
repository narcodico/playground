part of 'landing_bloc.dart';

abstract class LandingEvent extends Equatable {
  const LandingEvent();

  @override
  List<Object?> get props => [];
}

class UserModeChanged extends LandingEvent {
  const UserModeChanged(this.userMode);

  final UserMode userMode;

  @override
  List<Object?> get props => [userMode];
}

class GoBackRequested extends LandingEvent {
  const GoBackRequested();
}
