import 'package:app_mobile_horosope/features/onboarding/pages/onboarding_page.dart';
import 'package:app_mobile_horosope/features/user/providers/user_provider.dart';
import 'package:app_mobile_horosope/firebase_options.dart';
import 'package:app_mobile_horosope/navigator/main_navigator.dart';
import 'package:app_mobile_horosope/notifications/app_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Initialization());
}

class Initialization extends StatelessWidget {
  const Initialization({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider()..init(),
          lazy: false,
        )
      ],
      child: const _App(),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: AppNotifications.notificationsKey,
      navigatorKey: MainNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
        cupertinoOverrideTheme: const CupertinoThemeData(
          primaryColor: Color(0xFF6E56CF),
        ),
      ),
      home: const OnboardingPage(),
    );
  }
}

// class _Start extends StatelessWidget {
//   const _Start({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return const OnboardingPage();
//   }
// }
