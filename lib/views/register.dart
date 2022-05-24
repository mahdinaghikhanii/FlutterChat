import 'package:flutter/material.dart';

import '../module/constant.dart';
import '../module/widgets.dart';

class RegisterViews extends StatelessWidget {
  const RegisterViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: size.height,
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
                SizedBox(height: size.height * 0.04),
                Image.asset(
                  'assets/img/signup.png',
                  width: size.height * 0.34,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                MField(
                  size: size.width * 0.80,
                  secure: false,
                  icon: Icons.email,
                  hintText: "Email",
                  type: TextInputType.emailAddress, onChange: (String) {},
                  //  contoroller: registerProvider.emailTextEdit,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                MField(
                  size: size.width * 0.80,
                  secure: false,
                  icon: Icons.person,
                  hintText: 'UserName',
                  // contoroller: registerProvider.nameTextEdit,
                  type: TextInputType.name, onChange: (String) {},
                ),
                SizedBox(height: size.height * 0.01),
                MField(
                  size: size.width * 0.80,
                  secure: false,
                  icon: Icons.verified_user,
                  hintText: 'Password',
                  type: TextInputType.visiblePassword, onChange: (String) {},
                  //  contoroller: registerProvider.passwordTextEdit,
                ),
                SizedBox(
                  height: size.height * 0.00,
                ),
                MyButton(press: () {}, size: size, text: "SignUp"),
                Visibility(
                  //  visible: registerProvider.getvisivleTextStattusUser,
                  child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        "",
                        style: textTheme.subtitle1
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
