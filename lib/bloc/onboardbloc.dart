import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'blocstate.dart';

class OnBoardBloc extends Cubit<BlocState> {
  OnBoardBloc() : super(Initial()) {
    SharedPreferences.getInstance().then((value) {
      value.getInt('onboard-key') ?? 0;
      emit(Initial());
    });
  }

  void saveUserUsingOnBoard(int index) async {
    SharedPreferences _prfs = await SharedPreferences.getInstance();
    _prfs.setInt('onboard-key', index);
    emit(Initial());
  }
}
