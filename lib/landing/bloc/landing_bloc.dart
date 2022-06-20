import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:playground/landing/bloc/landing_state.dart';

export 'landing_state.dart';

part 'landing_event.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc() : super(const LandingState()) {
    on<UserModeChanged>(_onUserModeChanged);
    on<GoBackRequested>(_onGoBackRequested);
  }

  void _onUserModeChanged(UserModeChanged event, Emitter<LandingState> emit) {
    emit(
      LandingState(
        userMode: event.userMode,
      ),
    );
  }

  void _onGoBackRequested(GoBackRequested event, Emitter<LandingState> emit) {
    emit(const LandingState());
  }
}
