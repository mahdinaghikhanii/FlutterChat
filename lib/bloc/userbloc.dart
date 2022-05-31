// ignore_for_file: unnecessary_null_comparison

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchat/module/constant.dart';
import 'package:flutterchat/views/create_profile.dart';
import 'package:image_picker/image_picker.dart';

import '../views/home.dart';
import 'blocstate.dart';

class UserBloc extends Cubit<BlocState> {
  UserBloc() : super(Initial()) {
    _client();
    //_init();
  }
  late Account account;
  Client client = Client();
  _client() {
    client
        .setEndpoint(Constans.endpoint)
        .setProject(Constans.projectId)
        .setSelfSigned(status: true);
    account = Account(client);
  }

  init() {
    final user = getAccount();
    if (user != null) {
      emit(Authenticated());
    } else {
      emit(Problems());
    }
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
      await Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const CreateProfile()));
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

  void logout(BuildContext context) {
    if (state is Loading) return;
    try {
      emit(Loading());
    } catch (e) {
      emit(Failed(e as Exception));
    }
  }

  void createUser(String username, String bio, FileImage image) async {
    if (state is Loading) return;
    try {
      emit(Loading());
    } catch (e) {}
  }

  void pickImage(ImagePicker picker) {}
}
