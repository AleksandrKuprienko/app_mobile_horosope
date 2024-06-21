import 'package:app_mobile_horosope/components/custom_button.dart';
import 'package:app_mobile_horosope/components/spacers.dart';
import 'package:app_mobile_horosope/features/user/pages/registration_page.dart';
import 'package:app_mobile_horosope/icons/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO(OK): need rework this UI
    return Scaffold(
      body: CustomScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SpaceH120(),
                Transform.scale(
                  scale: 1.1,
                  child: SvgPicture.asset(
                    'assets/images/onboarding.svg',
                    height: 300,
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
                      SpaceH8(),
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
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                  child: CustomButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const RegistrationPage(),
                        ),
                      );
                    },
                    icon: const Icon(CustomIcons.arrow_right_alt),
                    title: 'Get Started',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
