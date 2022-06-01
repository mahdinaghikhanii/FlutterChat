import 'package:flutter/material.dart';

import '../module/constant.dart';
import '../module/extension.dart';
import '../module/widgets.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constans.navyblueshade1,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(
          Constans.defultpadding,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Create Your profile',
                style: context.textTheme.subtitle1!.copyWith(
                    color: kwhite, fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0),
                        width: 160,
                        height: 160,
                        child: CircleAvatar(
                          backgroundColor: kgrey300,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/icons/users.png",
                              width: 155,
                              height: 155,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: 105,
                      left: 120,
                      child: InkWell(
                        borderRadius:
                            BorderRadius.circular(Constans.bigBorderRadios),
                        onTap: () async {
                          context.userbloc.pickImage();
                        },
                        child: Container(
                            width: 55,
                            height: 55,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: kred),
                            child: const Center(
                                child: Icon(
                              Icons.camera_alt,
                              color: kwhite,
                              size: 28,
                            ))),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const MEdit(hint: "Username", autoFocus: false, password: false),
            const SizedBox(
              height: 20,
            ),
            const MEdit(hint: "Bio", autoFocus: false, password: false),
            const SizedBox(
              height: 40,
            ),
            MyButton(press: () {}, text: "Done")
          ],
        ),
      )),
    );
  }
}
