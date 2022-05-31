import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchat/module/constant.dart';
import 'package:flutterchat/module/extension.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Online',
          style: context.textTheme.subtitle2!.copyWith(
              color: kwhite, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
    );
  }
}
