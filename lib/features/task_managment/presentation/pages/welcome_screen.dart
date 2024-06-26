import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:goonline_app/features/task_managment/presentation/pages/dashboard_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeSplashScreen extends StatelessWidget {
  const WelcomeSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        
        duration: 3800,
        nextScreen: const DashboardScreen(),
        splash: Column(
          children: [
          Center(
            child: Center(child: LottieBuilder.asset('assets/welcome_screen_animation.json'),
          ),
          ),
        
        ],
        ),
        splashIconSize: 500          ,
        backgroundColor: Colors.white,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.leftToRight,
   
        
        
       
      ),
    );
  }
}