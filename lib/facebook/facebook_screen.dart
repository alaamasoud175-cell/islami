import 'package:flutter/material.dart';

class FacebookScreen extends StatelessWidget {
  static const String routeName = 'facebook';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/facebook_logo.svg',
                  width: 80,
                ),
              ),
            ),
            Image.asset('assets/images/Meta Logo.png', width: 100),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
