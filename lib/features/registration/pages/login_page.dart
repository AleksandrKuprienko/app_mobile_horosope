import 'package:app_mobile_horosope/components/custom_button.dart';
import 'package:app_mobile_horosope/components/custom_text_field.dart';
import 'package:app_mobile_horosope/features/registration/pages/registration_page.dart';
import 'package:app_mobile_horosope/icons/custom_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome',
                        style: TextStyle(
                          color: Color(0xFF6E56CF),
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'back!',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'Sign in to access your horoscope history and get updated one',
                        style: TextStyle(fontSize: 16, color: Color(0xFF646D7B)),
                      ),
                      const SizedBox(height: 32),
                      CustomTextField(
                        focusNode: FocusNode(),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        errorText: 'Erroremail',
                        hintText: 'Email',
                        isObscureText: false,
                        prefixIcon: CustomIcons.mail,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        focusNode: FocusNode(),
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        errorText: 'Erroremail',
                        hintText: 'Password',
                        isObscureText: true,
                        prefixIcon: CustomIcons.lock,
                        suffixIcon: CustomIcons.visibility_off,
                      ),
                      const SizedBox(height: 24),
                      GestureDetector(
                        onTap: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot password',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF0588F0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        title: 'Sign in',
                        onPressed: () {},
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE3E5EA)),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        height: 52,
                        child: Theme(
                          data: ThemeData(
                            cupertinoOverrideTheme: const CupertinoThemeData(
                              primaryColor: Colors.white,
                            ),
                          ),
                          child: CupertinoButton.filled(
                            borderRadius: BorderRadius.circular(12.0),
                            onPressed: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CustomIcons.google,
                                  color: Color(0xFF000000),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Continue with Google',
                                  style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE3E5EA)),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        height: 52,
                        child: Theme(
                          data: ThemeData(
                            cupertinoOverrideTheme: const CupertinoThemeData(
                              primaryColor: Colors.white,
                            ),
                          ),
                          child: CupertinoButton.filled(
                            borderRadius: BorderRadius.circular(12.0),
                            onPressed: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CustomIcons.apple,
                                  color: Color(0xFF000000),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Continue with Apple',
                                  style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegistrationPage()));
                    },
                    child: const Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: 'Don’t have an account? ', style: TextStyle(color: Color(0xFF868D9D))),
                            TextSpan(
                              text: 'Create an account',
                              style: TextStyle(
                                color: Color(0xFF6E56CF),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
