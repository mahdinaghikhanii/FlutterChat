import 'package:flutter/material.dart';

import '../module/constant.dart';
import '../module/extension.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:  ,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                'assets/icons/chatsmall.png',
              ),
              Text(
                'Online',
                style: context.textTheme.subtitle2!.copyWith(
                    color: kwhite, fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ],
          )),
      body: Container(
        padding: const EdgeInsets.all(Constans.defultpadding),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
