import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:todo_apps/main.dart';

class Splash_Screen extends StatefulWidget {
  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen>
    with TickerProviderStateMixin {
  late AnimationController Controller;
  late Animation<double> animation;
  @override
  void initState() {
    Controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = Tween(begin: 0.0, end: 4.0)
        .animate(CurvedAnimation(parent: Controller, curve: Curves.easeInOut))
      ..addStatusListener((status) {})
      ..addListener(() {
        setState(() {});
      });
    Controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: RotationTransition(
            turns: animation,
            child: ScaleTransition(
              scale: animation,
              child: EasySplashScreen(
                logo: Image.asset(
                  'assets/images/R.png',
                  height: 50,
                  width: 50,
                ),
                navigator: MyApp(false),
                durationInSeconds: 4,
                logoWidth: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
