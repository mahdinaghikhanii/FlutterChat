import 'package:flutter/material.dart';

import '../module/constant.dart';
import '../module/extension.dart';

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
