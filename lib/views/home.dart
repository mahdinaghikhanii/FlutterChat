import 'package:flutter/material.dart';

import '../module/constant.dart';
import '../module/extension.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        fixedColor: kblack,
        unselectedItemColor: grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (int index) {},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: "home"),
          //   BottomNavigationBarItem(icon: Icon(Icons.settings), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "home")
        ],
      ),
      backgroundColor: Constans.navyblueshade1,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Constans.navyblueshade1,
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
