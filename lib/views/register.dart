import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/blocstate.dart';
import '../module/constant.dart';
import '../module/extension.dart';
import '../module/widgets.dart';
import 'login.dart';

TextEditingController _username = TextEditingController();
TextEditingController _password = TextEditingController();

class Register extends StatelessWidget {
  final BlocState state;
  const Register({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _fromKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: Constans.navyblueshade1,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
              child: Form(
                key: _fromKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Hello!',
                          style: context.textTheme.subtitle2!.copyWith(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: kwhite),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Welcome in Onlin!',
                          textAlign: TextAlign.center,
                          style: context.textTheme.subtitle1!.copyWith(
                              color: kwhite,
                              fontSize: 25,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        MEdit(
                            hint: 'Enter username',
                            autoFocus: false,
                            notempty: false,
                            state: state,
                            controller: _username,
                            password: false),
                        const SizedBox(
                          height: 20,
                        ),
                        MEdit(
                            icon: CupertinoIcons.eye_slash,
                            hint: 'Password',
                            autoFocus: false,
                            state: state,
                            notempty: true,
                            controller: _password,
                            password: true),
                        const SizedBox(
                          height: 20,
                        ),
                        MEditConfigPassword(
                            icon: CupertinoIcons.eye_slash,
                            hint: 'Config Password',
                            autoFocus: false,
                            state: state,
                            pass: _password,
                            password: true),
                        const SizedBox(
                          height: 30,
                        ),
                        AbsorbPointer(
                            absorbing: state is Loading ? true : false,
                            child: state is Loading
                                ? const Padding(
                                    padding: EdgeInsets.only(top: 30),
                                    child: Mloading(),
                                  )
                                : MyButton(
                                    press: () {
                                      if (_fromKey.currentState!.validate()) {
                                        context.userbloc.register(
                                            _username.text,
                                            _password.text,
                                            context);
                                      }
                                    },
                                    text: "Create Account")),
                        state is Failed
                            ? MError(exception: (state as Failed).exception)
                            : state is CanEmpty
                                ? const Text('pls enter username or password')
                                : Container()
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AbsorbPointer(
                                absorbing: state is Loading ? true : false,
                                child: InkWell(
                                  onTap: () => context.nextAndRep(Login(
                                    state: state,
                                  )),
                                  child: Text("Sign in",
                                      style: context.textTheme.subtitle1!
                                          .copyWith(
                                              color: kwhite.withOpacity(0.8))),
                                ),
                              )
                            ]))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
