import 'package:flutter/material.dart';

class AppPage<T> extends MaterialPage<T> {
  const AppPage({
    super.key,
    super.maintainState,
    super.fullscreenDialog,
    super.name,
    super.arguments,
    super.restorationId,
    required super.child,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return AppPageRoute<T>(
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      settings: this,
      builder: (_) => child,
    );
  }
}

class AppPageRoute<T> extends PageRouteBuilder<T> {
  AppPageRoute({
    super.settings,
    super.maintainState,
    super.fullscreenDialog,
    super.barrierColor,
    super.barrierDismissible,
    super.barrierLabel,
    super.opaque,
    required WidgetBuilder builder,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> primaryAnimation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return FadeTransition(
              opacity: primaryAnimation,
              child: child,
            );
          },
          transitionDuration: const Duration(seconds: 2),
          reverseTransitionDuration: const Duration(seconds: 2),
        );
}
