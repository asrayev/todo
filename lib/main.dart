import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/screens/logorreg.dart';
import 'package:todo/screens/main_page.dart';
import 'package:todo/screens/onboarding.dart';
import 'package:todo/screens/splash.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext contex, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          home: MainPage(),
        );
      },
    );
  }
}