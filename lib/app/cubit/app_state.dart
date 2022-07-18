part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState(this.environment);

  final Environment environment;

  @override
  List<Object> get props => [environment];
}
