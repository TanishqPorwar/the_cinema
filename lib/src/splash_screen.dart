import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_cinema/src/ui/svg_image.dart';

import 'app.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  // goto homePage after 2 seconds
  startTime() async {
    var _duration = Duration(milliseconds: 1100);
    return Timer(
      _duration,
      navigationPage,
    );
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(
      // MaterialPageRoute(
      //   builder: (context) => App(),
      // ),
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => App(),
        transitionDuration: Duration(milliseconds: 1000),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeInBack),
          child: child,
        ),
      ),
    );
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    startTime();
    _controller.forward();
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: _animation,
            child: MySvgImage(
              path: "assets/images/cineluv_logo.svg",
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
