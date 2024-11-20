import 'package:flutter/material.dart';
import 'package:taskatii/core/functions/navigation.dart';
import 'package:taskatii/core/utils/text_Styles.dart';
import 'package:taskatii/feature/upload/upload_screen.dart';

class SplashSceen extends StatefulWidget {
  const SplashSceen({super.key});

  @override
  State<SplashSceen> createState() => _SplashSceenState();
}

class _SplashSceenState extends State<SplashSceen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3));
    pushWithReplacement(context, const UploadScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Lottie.asset(
              //   'assets/images/logo.json',
              //   width: 250,
              // ),
              Text('Taskati', style: getTitleTextStyle()),
              Text(
                'it\'s time to get oranized!',
                style: getSmallTextStyle(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
