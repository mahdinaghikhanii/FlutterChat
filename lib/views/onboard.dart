import 'package:flutter/material.dart';
import 'package:flutterchat/module/extension.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../module/constant.dart';
import 'login_page.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      overrideNext: const Text('', style: TextStyle(color: kblack)),
      isTopSafeArea: true, // Safe Area to avoid overlaps with the status bar
      showDoneButton: true,

      done: const Text('done', style: TextStyle(color: kblack)),

      // OnDone takes an anonymous function. So when all the slides are completed
      //we are navigating the user to Login Page
      onDone: () {
        context.onboardbloc.saveUserUsingOnBoard(1);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login()));
      },

      // A skip button to skip those pages(some prefer some doesn't)
      showSkipButton: true,
      skip: const Text('Skip', style: TextStyle(color: kblack)),

      showNextButton: true,

      // Same here, if the user skips - redirects to loginPage
      onSkip: () {},

      // Now pages expect a list of PageViewModel
      // That's what we have added here
      pages: [
        PageViewModel(
          image: Lottie.asset('assets/lottie/mobile.json',
              fit: BoxFit.contain, height: 400),
          body: "Freedom talk to any person with assured privacy",
          title: "Welcome To Online !",
        ),
        PageViewModel(
          image: Lottie.asset("assets/lottie/chat.json", height: 400),
          body: "Send text, images, videos and even documents to your friends",
          title: "Chat with your friends",
        ),
        PageViewModel(
          image: Lottie.asset("assets/lottie/backend.json", height: 400),
          body:
              "Appwrite is an Open-Source self-hosted solution that provides developers with a set of easy-to-use and integrate REST APIs to manage their core backend needs.",
          title: "AppWrite used as a Backend Service",
        ),
      ],
    );
  }
}
