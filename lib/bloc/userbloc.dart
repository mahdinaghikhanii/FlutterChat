import 'package:appwrite/appwrite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchat/bloc/blocstate.dart';
import 'package:flutterchat/module/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends Cubit<BlocState> {
  UserBloc() : super(Initial()) {
    _init();
  }

  late Account account;
  Client client = Client();

  _init() {
    client
        .setEndpoint(Constans.endpoint)
        .setProject(Constans.projectId)
        .setSelfSigned(status: true);
    account = Account(client);
  }

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
