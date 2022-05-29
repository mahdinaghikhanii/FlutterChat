import 'package:flutter/material.dart';

@immutable
abstract class BlocState {}

class Initial extends BlocState {}

class Loading extends BlocState {}

class Failed extends BlocState {}

class Authenticated extends BlocState {}

class Welcome extends BlocState {}
