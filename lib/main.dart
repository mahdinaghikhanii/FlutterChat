import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/blocstate.dart';
import 'bloc/onboardbloc.dart';
import 'bloc/themebloc.dart';
import 'bloc/userbloc.dart';
import 'views/login.dart';
import 'views/onboard.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<UserBloc>(create: (_) => UserBloc()),
    BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
    BlocProvider<OnBoardBloc>(create: (_) => OnBoardBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, BlocState>(
        builder: (BuildContext context, state) {
      return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: BlocBuilder<OnBoardBloc, BlocState>(builder: (_, state) {
            if (state is Welcome) {
              return BlocBuilder<UserBloc, BlocState>(
                builder: (_, states) {
                  //  if (state is Authenticated) return const Home();
                  // if (state is Problems) return Login(state: state);
                  return Login(state: states);
                },
              );
            }
            return OnBoard(
              state: state,
            );
          }));
    });
  }
}
