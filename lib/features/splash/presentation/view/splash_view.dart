import 'package:abs_onlinestore/features/login/presentation/view/login_view.dart';
import 'package:abs_onlinestore/features/splash/presentation/view_model/splash_model.dart';
import 'package:flutter/material.dart';


class SplashScreenView extends StatelessWidget {
  final SplashModel _viewmodel = SplashModel();

  SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _viewmodel.initApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AnimatedSplashScreen(
            duration: 2500,
            splashIconSize: double.infinity,
            backgroundColor: const Color(0xFF6DB7C6), // Light blue background
            splash: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                const Text(
                  'Welcome to Online Store',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Image.asset(
                  'assets/icons/logo.png', // Use your diamond logo here
                  height: 120,
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/jett.png', // Left character
                        height: 160,
                      ),
                      Image.asset(
                        'assets/images/raze.png', // Right character
                        height: 160,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            nextScreen: const SignInView(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.bottomToTop,
          );
        } else {
          return const Scaffold(
            backgroundColor: Color(0xFF6DB7C6),
            body: Center(child: CircularProgressIndicator(color: Colors.white)),
          );
        }
      },
    );
  }
}
