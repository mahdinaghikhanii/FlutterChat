import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'blocstate.dart';

class OnBoardBloc extends Cubit<BlocState> {
  OnBoardBloc() : super(Welcome()) {
    checkIfFirstTimeUserSeeOnBoarding();
  }

  saveFirstTimeUserSeeOnBoarding() async {
    SharedPreferences _prfs = await SharedPreferences.getInstance();
    _prfs.setInt('onboard-key', 0);
    emit(Welcome());
  }

  checkIfFirstTimeUserSeeOnBoarding() async {
    SharedPreferences prfs = await SharedPreferences.getInstance();
    int s = prfs.getInt('onboard-key') ?? 1;

    s != 0 ? emit(Initial()) : emit(Welcome());
  }
}
