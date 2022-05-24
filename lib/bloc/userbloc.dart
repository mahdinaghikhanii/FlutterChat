import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchat/bloc/blocstate.dart';

class UserBloc extends Cubit<BlocState> {
  UserBloc() : super(Initial());
}
