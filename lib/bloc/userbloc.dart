import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchat/bloc/blocstate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends Cubit<BlocState> {
  UserBloc() : super(Initial()) {}

  void authenticate(String username, String password) async {
    try {
      SharedPreferences prfs = await SharedPreferences.getInstance();
      emit(Authenticated());
    } catch (e) {
      emit(Failed(e as Exception));
    }
  }

  void register(String username, pass) async {}
}
