import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchat/module/constant.dart';

import '../main.dart';
import 'blocstate.dart';

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

  Future<User?> getAccount() async {
    try {
      return await account.get();
    } on Exception catch (e) {
      Failed(e);
    }
    return null;
  }

  void authenticate(
      String username, String password, BuildContext context) async {
    if (state is Loading) return;

    try {
      emit(Loading());
      await account.createSession(email: username, password: password);
      await Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
      emit(Authenticated());
    } catch (e) {
      emit(Failed(e as Exception));
      await showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Error Occured'),
                content: Text(e.toString()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Ok"))
                ],
              ));
    }
  }

  void register(String username, String pass, BuildContext context) async {
    if (state is Loading) return;
    try {
      emit(Loading());
      await account.create(
          email: username, password: pass, userId: 'unique()', name: username);
      await Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
    } catch (e) {
      emit(Failed(e as Exception));
    }
  }

  void logout(BuildContext context) {
    if (state is Loading) return;
    try {
      emit(Loading());
    } catch (e) {
      emit(Failed(e as Exception));
    }
  }
}
