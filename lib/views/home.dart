import 'package:flutter/material.dart';

import '../module/constant.dart';
import '../module/extension.dart';
import '../module/widgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        fixedColor: Colors.yellow.shade600.withOpacity(0.9),
        unselectedItemColor: grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (int index) {},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: "Contacs"),
          // BottomNavigationBarItem(icon: Icon(Icons.call), label: "Call"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
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
          children: [
            const MyInputField(
              icon: Icons.search,
              hintText: "Search for message or users...",
            ),
            const SizedBox(
              height: 20,
            ),
            MIteamView(
              iconData: Icons.favorite,
              img: 'assets/img/login.png',
              ontap: () {},
              subTitle: 'salam',
              time: '22.12',
              title: 'mahdinagni',
            )
          ],
        ),
      ),
    );
  }
}
