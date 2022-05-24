import 'package:flutter/material.dart';

import '../module/widgets.dart';
import 'register.dart';

class LoginViews extends StatelessWidget {
  const LoginViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: SizedBox(
      height: size.height,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style:
                    textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Image.asset(
                'assets/img/login.png',
                height: size.height * 0.40,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              MField(
                size: size.width * 0.80,
                hintText: 'Email',
                icon: Icons.person,
                secure: false,
                type: TextInputType.text, onChange: (String) {},
                //contoroller: loginProvider.emailTextEdit,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              MField(
                //   contoroller: loginProvider.passwordtTextEdit,
                size: size.width * 0.80,
                hintText: 'Password',
                icon: Icons.verified_user,
                secure: false,
                type: TextInputType.text, onChange: (String) {},
              ),
              SizedBox(height: size.height * 0.01),
              MyButton(press: () {}, size: size, text: 'Login'),
              SizedBox(
                height: size.height * 0.01,
              ),
              QoustionText(
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterViews()));
                },
              ),
              Text('Mahdi',
                  style: textTheme.subtitle1
                      ?.copyWith(fontSize: 14, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    ));
  }
}
