import 'package:flutter/material.dart';

import '../module/constant.dart';
import '../module/extension.dart';
import '../module/widgets.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: context.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'SignUp',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: context.height * 0.04),
                Image.asset(
                  'assets/img/signup.png',
                  width: context.height * 0.34,
                ),
                SizedBox(
                  height: context.height * 0.03,
                ),
                MField(
                  size: context.width * 0.80,
                  secure: false,
                  icon: Icons.email,
                  hintText: "Email",
                  type: TextInputType.emailAddress, onChange: (str) {},
                  //  contoroller: registerProvider.emailTextEdit,
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                MField(
                  size: context.width * 0.80,
                  secure: false,
                  icon: Icons.person,
                  hintText: 'UserName',
                  // contoroller: registerProvider.nameTextEdit,
                  type: TextInputType.name, onChange: (str) {},
                ),
                SizedBox(height: context.height * 0.01),
                MField(
                  size: context.width * 0.80,
                  secure: false,
                  icon: Icons.verified_user,
                  hintText: 'Password',
                  type: TextInputType.visiblePassword, onChange: (str) {},
                  //  contoroller: registerProvider.passwordTextEdit,
                ),
                SizedBox(
                  height: context.height * 0.00,
                ),
                MyButton(press: () {}, text: "SignUp"),
                Visibility(
                  //  visible: registerProvider.getvisivleTextStattusUser,
                  child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        "",
                        style: context.textTheme.subtitle1
                            ?.copyWith(color: kblackappbar, fontSize: 16),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
