import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground/app/cubit/app_cubit.dart';
import 'package:playground/profile/cubit/profile_cubit.dart';
import 'package:playground/repository/repository.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<Repository, ProfileCubit>(
      update: (context, newRepository, previousProfileCubit) => ProfileCubit(
          newRepository,
          initialState: previousProfileCubit?.state),
      dispose: (_, previousProfileCubit) => previousProfileCubit.close(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              // ! `context.watch` or `context.select` doesn't work
              // title: Text(
              //   // context.select((ProfileCubit cubit) => cubit.state.result),
              //   // context.watch<ProfileCubit>().state.result,
              //   style: TextStyle(color: Colors.red),
              // ),
              // * `BlocBuilder` works!
              title: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return Text(
                    state.result,
                    style: TextStyle(color: Colors.red),
                  );
                },
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  label: Text('Fetch from repo'),
                  heroTag: 'fetch',
                  onPressed: () {
                    context.read<ProfileCubit>().fetch();
                  },
                ),
                FloatingActionButton.extended(
                  label: Text('Switch environment'),
                  heroTag: 'switch',
                  onPressed: () {
                    context.read<AppCubit>().switchEnvironment();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
