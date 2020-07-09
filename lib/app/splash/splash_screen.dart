import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    _animation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    Timer(
      Duration(milliseconds: 2500),
      () => Modular.to.pushReplacementNamed("/start"),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    _animationController.forward();

    return Container(
      color: Colors.white,
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.translationValues(
                size.width * _animation.value,
                0.0,
                0.0,
              ),
              child: Icon(
                Icons.location_city,
                color: Colors.black,
                size: size.height * 0.3,
              ),
            );
          },
        ),
      ),
    );
  }
}
