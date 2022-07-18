import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground/app/cubit/app_cubit.dart';
import 'package:playground/profile/view/profile.dart';
import 'package:playground/repository/repository.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: ProxyProvider<AppCubit, Repository>(
        update: (context, newAppCubit, previousRepository) =>
            Repository(newAppCubit.state.environment.name),
        child: MaterialApp(
          home: Home(),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Text(state.environment.name);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Go to profile'),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Profile(),
          ));
        },
      ),
    );
  }
}
