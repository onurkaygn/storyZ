import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_story_application/helper/global.dart';
import 'package:flutter_story_application/helper/pref.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnBoarding = false;
  }

  @override
  Widget build(BuildContext context) {
    //initializing device size
    mq = MediaQuery.sizeOf(context);
    return const Scaffold(
      body: Center(
        child: Text("Welcome to Home Screen"),
      ),
    );
  }
}
