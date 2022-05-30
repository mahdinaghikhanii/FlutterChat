import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchat/bloc/blocstate.dart';

import 'constant.dart';
import 'extension.dart';

class MEdit extends StatelessWidget {
  final String hint;
  final Function(String?)? onChange;
  final bool autoFocus;
  final bool notempty;
  final TextEditingController? controller;
  final bool password;
  final BlocState? state;
  final IconData? icon;

  const MEdit(
      {required this.hint,
      required this.autoFocus,
      required this.password,
      this.state,
      this.icon,
      this.notempty = false,
      this.controller,
      this.onChange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: const TextStyle(fontSize: 18, color: kwhite),
        controller: controller,
        onChanged: onChange,
        validator: (val) {
          if ((val ?? '').isEmpty && notempty) {
            state is CanEmpty;
            return "Enter user name and password";
          }
          return null;
        },
        decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: Constans.normalPadding),
              child: Icon(
                icon,
                color: kwhite.withOpacity(0.4),
                size: 26,
              ),
            ),
            enabled: true,
            //   fillColor: ,
            //  filled: true,

            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(Constans.mediumBorderRadios),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kwhite.withOpacity(0.4), width: 2),
              borderRadius: BorderRadius.circular(Constans.mediumBorderRadios),
            ),
            contentPadding: const EdgeInsets.all(26),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8), gapPadding: 18),
            labelText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
            labelStyle: const TextStyle(
                color: kwhite, fontSize: 16, fontWeight: FontWeight.w600)),
        obscureText: password);
  }
}

class MEditConfigPassword extends StatelessWidget {
  final String hint;
  final Function(String?)? onChange;
  final bool autoFocus;
  final bool notempty;
  final TextEditingController? controller;
  final bool password;
  final BlocState? state;
  final TextEditingController pass;
  final IconData? icon;

  const MEditConfigPassword(
      {required this.hint,
      required this.pass,
      required this.autoFocus,
      required this.password,
      this.state,
      this.icon,
      this.notempty = false,
      this.controller,
      this.onChange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: const TextStyle(fontSize: 18, color: kwhite),
        controller: controller,
        onChanged: onChange,
        validator: (value) {
          if (value != pass.text) {
            return 'Passwords do not match!';
          }
          return null;
        },
        decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: Constans.normalPadding),
              child: Icon(
                icon,
                color: kwhite.withOpacity(0.4),
                size: 26,
              ),
            ),
            enabled: true,
            //   fillColor: ,
            //  filled: true,

            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(Constans.mediumBorderRadios),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kwhite.withOpacity(0.4), width: 2),
              borderRadius: BorderRadius.circular(Constans.mediumBorderRadios),
            ),
            contentPadding: const EdgeInsets.all(26),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8), gapPadding: 18),
            labelText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
            labelStyle: const TextStyle(
                color: kwhite, fontSize: 16, fontWeight: FontWeight.w600)),
        obscureText: password);
  }
}

class MyButton extends StatelessWidget {
  final Function()? press;
  final String text;
  // ignore: use_key_in_widget_constructors
  const MyButton({required this.press, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(Constans.mediumBorderRadios),
        ),
        width: double.infinity,
        height: 90,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: kred.withOpacity(0.8)),
            onPressed: press,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
              child: Text(text,
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: kwhite, fontSize: 18)),
            ),
          ),
        ));
  }
}

class QoustionText extends StatelessWidget {
  const QoustionText(
      {Key? key,
      required this.ontapboldqustion,
      required this.qustion,
      this.boldQustion})
      : super(key: key);
  final Function()? ontapboldqustion;
  final String qustion;
  final String? boldQustion;

  @override
  Widget build(BuildContext context) {
    final textThme = Theme.of(context).textTheme;
    return InkWell(
      onTap: ontapboldqustion,
      child: Container(
        padding: const EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(qustion,
                style: textThme.subtitle1
                    ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500)),
            Text(boldQustion ?? '',
                style: textThme.subtitle1?.copyWith(
                    color: kViolet, fontSize: 16, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}

class MError extends StatelessWidget {
  final Exception exception;

  const MError({
    Key? key,
    required this.exception,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      exception.toString(),
      style: context.textTheme.subtitle1!
          .copyWith(color: kred, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

class Mloading extends StatelessWidget {
  const Mloading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        radius: 15,
        color: kwhite,
      ),
    );
  }
}
