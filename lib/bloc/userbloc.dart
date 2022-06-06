// ignore_for_file: unnecessary_null_comparison

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchat/module/constant.dart';
import 'package:flutterchat/repository/user_data.dart';
import 'package:flutterchat/views/create_profile.dart';
import 'package:image_picker/image_picker.dart';

import '../views/home.dart';
import 'blocstate.dart';

class UserBloc extends Cubit<BlocState> {
  UserBloc() : super(Initial()) {
    _client();
  }

  final ImagePicker _picker = ImagePicker();
  XFile? img;

  late Account account;
  late UserData _userdata;
  late Storage storage;
  Client client = Client();
  _client() {
    client
        .setEndpoint(Constans.endpoint)
        .setProject(Constans.projectId)
        .setSelfSigned(status: true);
    account = Account(client);
    storage = Storage(client);
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
          MaterialPageRoute(builder: (context) => CreateProfile(state: state)));
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

      //_image != null ? await
    } catch (e) {
      emit(Failed(Exception(e)));
    }
  }

  void pickImage(ImagePicker? image) async {
    try {
      final XFile? imgAddres =
          await _picker.pickImage(source: ImageSource.gallery);
      if (imgAddres == null) return;
      img = imgAddres;

      emit(LoadingImage());
    } catch (e) {
      emit(Failed(Exception(e)));
    }
  }

  void createUserStorage(String name, String bio, String imgId) async {
    if (state is Loading) return;

    try {
      emit(Loading());
      img != null
          ? await _userdata
              .uploadProfilePicture(img!.path, img!.name)
              .then((imgid) => _userdata.addUser(name, bio, imgId))
          : _userdata.addUser(name, bio, 'assets/icons/users.png');
    } catch (e) {
      emit(Failed(Exception(e)));
    }
  }
}
