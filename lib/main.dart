import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchat/bloc/onboardbloc.dart';
import 'package:flutterchat/views/login.dart';
import 'package:flutterchat/views/onboard.dart';

import 'bloc/blocstate.dart';
import 'bloc/themebloc.dart';
import 'bloc/userbloc.dart';

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
              return Login(
                state: state,
              );
            }
            return OnBoard(
              state: state,
            );
          }));
    });
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
