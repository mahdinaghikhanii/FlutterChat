import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/blocstate.dart';
import 'bloc/themebloc.dart';
import 'bloc/userbloc.dart';
import 'views/onboard.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<UserBloc>(create: (_) => UserBloc()),
    BlocProvider<ThemeBloc>(create: (_) => ThemeBloc())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
          home: const OnBoard());
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
