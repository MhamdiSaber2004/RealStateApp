import 'package:flutter/material.dart';
import 'package:flutterfront/core/constants/app_colors.dart';
import 'package:flutterfront/router.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Wait 3 seconds, then navigate safely
    Future.delayed( Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => RouterPage()),
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accent,
      body: Center(
        child: Column(
          children: [
            const Gap(300),
            Text(
              "REAL ESTATE",
              style: TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            const Spacer(),
            Image.asset(
              'assets/img/splash.png',
              height: 200,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
