import 'package:bloc/bloc.dart';
import 'package:playground/landing/bloc/landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(const LandingState());

  void changeUserMode(UserMode userMode) => emit(
        LandingState(
          userMode: userMode,
        ),
      );

  void goBack() => emit(const LandingState());
}
