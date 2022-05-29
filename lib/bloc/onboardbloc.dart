import 'package:appwrite/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'blocstate.dart';

class OnBoardBloc extends Cubit<BlocState> {
  OnBoardBloc() : super(Authenticated()) {
    getSaveUserUsingOnBoard();
  }

  saveUserUsingOnBoard(int index) async {
    SharedPreferences _prfs = await SharedPreferences.getInstance();
    _prfs.setInt('onboard-key', index);
    emit(Welcome(index));
  }

  getSaveUserUsingOnBoard() async {
    SharedPreferences prfs = await SharedPreferences.getInstance();
    int s = prfs.getInt('onboard-key') ?? 0;

    if (s != 1) return emit(Authenticated());
  }
}
