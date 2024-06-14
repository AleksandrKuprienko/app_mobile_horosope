import 'package:app_mobile_horosope/icons/custom_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 120),
          Transform.scale(
            scale: 1.1,
            child: SvgPicture.asset(
              'assets/images/onboarding.svg',
              height: 320,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 40,
            ),
            child: Column(
              children: [
                Text(
                  'Unlock Your',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Astrological Insights',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Dive into the world of horoscopes and \ndiscover what the stars have in store for you.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF646D7B),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Start your personalized journey today.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFF646D7B)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 50),
            child: CupertinoButton.filled(
              onPressed: () {},
              borderRadius: BorderRadius.circular(12.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 8),
                  Text(
                    'Get Started',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(CustomIcons.arrow_right_alt)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
