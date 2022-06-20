import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground/app/app_page.dart';
import 'package:playground/landing/bloc/landing_bloc.dart';
import 'package:playground/landing/bloc/landing_cubit.dart';

class NewUserPage extends StatelessWidget {
  const NewUserPage._();

  static Page page() => AppPage<void>(
        key: const ValueKey('new_user_page'),
        child: const NewUserPage._(),
      );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<LandingBloc>().add(const GoBackRequested());
        context.read<LandingCubit>().goBack();
        context.flow<UserMode>().update((_) => UserMode.none);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Hero(
            tag: 'logo',
            child: CircleAvatar(
              backgroundColor: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
