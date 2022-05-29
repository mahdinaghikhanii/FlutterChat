import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchat/module/constant.dart';
import 'package:flutterchat/module/widgets.dart';

import '../module/extension.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constans.navyblueshade1,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Hello Again!',
                      style: context.textTheme.subtitle2!.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: kwhite),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Welcome back you\'ve\nbeen missed!',
                      textAlign: TextAlign.center,
                      style: context.textTheme.subtitle1!.copyWith(
                          color: kwhite,
                          fontSize: 25,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const MEdit(
                        hint: 'Enter username',
                        autoFocus: false,
                        password: false),
                    const SizedBox(
                      height: 20,
                    ),
                    const MEdit(
                        icon: CupertinoIcons.eye_slash,
                        hint: 'Password',
                        autoFocus: false,
                        password: false),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [const Spacer(), text('Recovery Password')],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyButton(press: () {}, text: "Sign in"),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Not o member?",
                          style: context.textTheme.subtitle1!
                              .copyWith(color: kwhite)),
                      TextSpan(
                          text: " Register now",
                          style: context.textTheme.subtitle1!
                              .copyWith(color: kred.withOpacity(0.8)))
                    ]))),
              ],
            ),
          ),
        ));
  }
}
