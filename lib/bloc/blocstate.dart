import 'package:flutter/material.dart';

@immutable
abstract class BlocState {}

class Initial extends BlocState {}

class Loading extends BlocState {}

class Failed extends BlocState {
  final Exception exception;
  Failed(this.exception);
}

class Problems extends BlocState {}

class Authenticated extends BlocState {}

class Welcome extends BlocState {}

class CanEmpty extends BlocState {}

class LoadingImage extends BlocState {}
