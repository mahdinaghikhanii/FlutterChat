import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchat/bloc/onboardbloc.dart';

extension ContextExtension on BuildContext {
  OnBoardBloc get onboardbloc => read<OnBoardBloc>();
}
