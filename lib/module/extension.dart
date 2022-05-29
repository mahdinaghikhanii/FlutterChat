import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchat/bloc/onboardbloc.dart';

extension ContextExtension on BuildContext {
  OnBoardBloc get onboardBlocs => read<OnBoardBloc>();

  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension WidgetsExtension on Widget {
  Widget center(Widget child) => Center(
        child: child,
      );
}
