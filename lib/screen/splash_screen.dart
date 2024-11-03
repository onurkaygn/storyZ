import 'package:flutter/material.dart';
import 'package:flutter_story_application/helper/global.dart';
import 'package:flutter_story_application/helper/pref.dart';
import 'package:flutter_story_application/screen/home_screen.dart';
import 'package:flutter_story_application/screen/onboarding_screen.dart';
import 'package:flutter_story_application/widget/custom_loading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) =>
              Pref.showOnBoarding ? const OnboardingScreen() : HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    //initializing device size
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            Card(
              color: Colors.black,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(mq.width * .05),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: mq.width * .45,
                ),
              ),
            ),
            const Spacer(),
            //
            const CustomLoading(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
