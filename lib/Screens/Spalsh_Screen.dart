import 'package:flutter/material.dart';
import 'dart:async';
import '../Widgets/firstPage.dart';
import '../helpers/animations.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Welcome();
  }
}

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SecondScreen();
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  bool _a = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 6000), () {
      setState(() {
        _a = !_a;
      });
    });
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.of(context)
          .pushReplacement(SlideTransitionAnimation(const Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(18, 0, 49, 100),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 2500),
            curve: Curves.fastLinearToSlowEaseIn,
            width: _a ? width : 0,
            height: height,
            color: Colors.black,
          ),
          Center(
            child: DelayedAnimation(
                delay: 200, child: Image.asset('Assets/icon.png',width: 90),),
          ),
        ],
      ),
    );
  }
}

class SlideTransitionAnimation extends PageRouteBuilder {
  final Widget page;

  SlideTransitionAnimation(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: const Duration(milliseconds: 6000),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
        curve: Curves.fastLinearToSlowEaseIn,
        parent: animation,
      );
      return SlideTransition(
        position: Tween(
            begin: const Offset(1.0, 0.0),
            end: const Offset(0.0, 0.0))
            .animate(animation),
        textDirection: TextDirection.rtl,
        child: page,
      );
    },);
}
