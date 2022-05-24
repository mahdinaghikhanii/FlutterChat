import 'package:flutter/material.dart';
import 'package:flutterchat/module/constant.dart';

class MField extends StatelessWidget {
  final double? size;
  final TextInputType? type;
  final bool? secure;
  final String? hintText;
  final bool notempty;
  final bool autofucose;
  final IconData? icon;
  final Function(String)? onChange;
  final TextEditingController? contoroller;

  // ignore: use_key_in_widget_constructors
  const MField(
      {this.size,
      required this.onChange,
      this.notempty = false,
      this.contoroller,
      this.secure,
      this.icon,
      this.autofucose = false,
      this.hintText,
      this.type});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
        width: size,
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: kViolet),
        child: TextFormField(
          validator: (val) {
            if ((val ?? '').isEmpty && notempty) {
              return "cannot be empty";
            }
            return null;
          },
          onChanged: onChange,
          controller: contoroller,
          style: textTheme.button?.copyWith(color: kwhite),
          cursorColor: kViolet,
          decoration: InputDecoration(
              icon: Icon(icon, color: kwhite),
              hintText: hintText,
              hintStyle: textTheme.button?.copyWith(color: kwhite),
              border: InputBorder.none),
        ));
  }
}

class MEdit extends StatelessWidget {
  final String hint;
  final Function(String)? onChange;
  final bool autoFocus;
  final bool notempty;
  final TextEditingController? controller;
  final bool password;

  const MEdit(
      {required this.hint,
      required this.autoFocus,
      required this.password,
      this.notempty = false,
      this.controller,
      this.onChange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        onChanged: onChange,
        validator: (val) {
          if ((val ?? '').isEmpty && notempty) {
            return "cannot be empty";
          }
          return null;
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8), gapPadding: 20),
            labelText: hint,
            labelStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16)),
        obscureText: password);
  }
}

class MyButton extends StatelessWidget {
  final Size size;
  final Function()? press;
  final String text;
  // ignore: use_key_in_widget_constructors
  const MyButton({required this.press, required this.size, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        width: size.width * 0.80,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: kViolet),
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
  const QoustionText({Key? key, required this.ontap}) : super(key: key);
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    final textThme = Theme.of(context).textTheme;
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don`t Have Account ?',
                style: textThme.subtitle1
                    ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500)),
            Text(' SignUp Now',
                style: textThme.subtitle1?.copyWith(
                    color: kViolet, fontSize: 16, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
