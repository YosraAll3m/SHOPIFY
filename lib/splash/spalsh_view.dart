import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../screens/onboarding/onboarding.dart';



class Splash extends StatefulWidget{
  const Splash({Key key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Lottie.asset("assets/logo.json",animate: true,repeat: false,
             controller: controller,
              onLoaded: (value) {
                controller..duration = value.duration
                  ..forward().whenComplete(() {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>OnBoardingScreen()));

                  });
              }
              )



      ),
    );
  }
}