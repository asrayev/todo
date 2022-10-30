import 'package:flutter/material.dart';
import 'package:todo/screens/onboarding.dart';
import 'package:todo/utils/myimages.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  onNextPage(){
    Future.delayed(Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Onboarding()));
    });
  }

  @override
  void initState() {
    super.initState();
    onNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: Center(child: Image.asset(MyImages.splash,  height: 180, width: 140,)),
    );
  }
}

