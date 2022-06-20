import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground/app/app_page.dart';
import 'package:playground/landing/bloc/landing_bloc.dart';
import 'package:playground/landing/bloc/landing_cubit.dart';

class LandingPage extends StatefulWidget {
  const LandingPage._();

  static Page page() => AppPage<void>(
        key: const ValueKey('landing_page'),
        child: const LandingPage._(),
      );

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Hero(
          tag: 'logo',
          child: CircleAvatar(
            backgroundColor: Colors.red,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          context
              .read<LandingBloc>()
              .add(const UserModeChanged(UserMode.brandNew));
          context.read<LandingCubit>().changeUserMode(UserMode.brandNew);
          context.flow<UserMode>().update((_) => UserMode.brandNew);
        },
      ),
    );
  }
}
