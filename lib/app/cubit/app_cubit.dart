import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_state.dart';

enum Environment { development, staging }

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState(Environment.development));

  void switchEnvironment() {
    emit(AppState(
      state.environment == Environment.development
          ? Environment.staging
          : Environment.development,
    ));
  }
}
