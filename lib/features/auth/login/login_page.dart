import 'package:app_mobile_horosope/components/custom_button.dart';
import 'package:app_mobile_horosope/components/custom_text_field.dart';
import 'package:app_mobile_horosope/components/spacers.dart';
import 'package:app_mobile_horosope/features/auth/bloc/auth_bloc.dart';
import 'package:app_mobile_horosope/icons/custom_icons_icons.dart';
import 'package:app_mobile_horosope/navigator/main_navigator.dart';
import 'package:app_mobile_horosope/notifications/app_notifications.dart';
import 'package:app_mobile_horosope/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPassword = false;

  @override
  void initState() {
    _emailController.text = 'sahkakup3r@gmail.com';
    _passwordController.text = 'qwerty';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
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
                            color: AppPallete.purple500,
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            height: 0.8,
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
                          style: TextStyle(fontSize: 16, color: AppPallete.gray500),
                        ),
                        const SpaceH32(),
                        CustomTextField(
                          focusNode: FocusNode(),
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          hintText: 'Email',
                          isObscureText: false,
                          prefixIcon: CustomIcons.mail,
                        ),
                        const SpaceH16(),
                        CustomTextField(
                          focusNode: FocusNode(),
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordController,
                          hintText: 'Password',
                          isObscureText: showPassword,
                          onSuffixTap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          prefixIcon: CustomIcons.lock,
                          suffixIcon: CustomIcons.visibility_off,
                        ),
                        const SpaceH24(),
                        GestureDetector(
                          onTap: () {
                            if (_emailController.text.isNotEmpty) {
                              context.read<AuthBloc>().add(ForgotPasswordEvent(email: _emailController.text));
                            } else {
                              AppNotifications.errorSnackBar('Please enter your email');
                            }
                          },
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
                        const SpaceH24(),
                        CustomButton(
                          title: 'Sign in',
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  LoginEvent(email: _emailController.text, password: _passwordController.text),
                                );
                          },
                        ),
                        const SpaceH16(),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     border: Border.all(color: AppPallete.gray100),
                        //     borderRadius: BorderRadius.circular(12.0),
                        //   ),
                        //   height: 52,
                        //   child: Theme(
                        //     data: ThemeData(
                        //       cupertinoOverrideTheme: const CupertinoThemeData(
                        //         primaryColor: AppPallete.white,
                        //       ),
                        //     ),
                        //     child: CupertinoButton.filled(
                        //       borderRadius: BorderRadius.circular(12.0),
                        //       onPressed: () {
                        //         AppNotifications.errorSnackBar('Not implemented');
                        //       },
                        //       child: const Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Icon(
                        //             CustomIcons.google,
                        //             color: Color(0xFF000000),
                        //           ),
                        //           SpaceW8(),
                        //           Text(
                        //             'Continue with Google',
                        //             style: TextStyle(
                        //               color: Color(0xFF000000),
                        //               fontWeight: FontWeight.w600,
                        //               fontSize: 16,
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // const SpaceH16(),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     border: Border.all(color: AppPallete.gray100),
                        //     borderRadius: BorderRadius.circular(12.0),
                        //   ),
                        //   height: 52,
                        //   child: Theme(
                        //     data: ThemeData(
                        //       cupertinoOverrideTheme: const CupertinoThemeData(
                        //         primaryColor: AppPallete.white,
                        //       ),
                        //     ),
                        //     child: CupertinoButton.filled(
                        //       borderRadius: BorderRadius.circular(12.0),
                        //       onPressed: () {
                        //         AppNotifications.errorSnackBar('Not implemented');
                        //       },
                        //       child: const Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Icon(
                        //             CustomIcons.apple,
                        //             color: Color(0xFF000000),
                        //           ),
                        //           SpaceW8(),
                        //           Text(
                        //             'Continue with Apple',
                        //             style: TextStyle(
                        //               color: Color(0xFF000000),
                        //               fontWeight: FontWeight.w600,
                        //               fontSize: 16,
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        MainNavigator.registration();
                      },
                      child: const Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: 'Don’t have an account? ', style: TextStyle(color: AppPallete.purple500)),
                              TextSpan(
                                text: 'Create an account',
                                style: TextStyle(
                                  color: AppPallete.purple500,
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
      ),
    );
  }
}
