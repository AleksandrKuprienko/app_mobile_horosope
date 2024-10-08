import 'package:app_mobile_horosope/components/custom_button.dart';
import 'package:app_mobile_horosope/components/custom_text_field.dart';
import 'package:app_mobile_horosope/components/spacers.dart';
import 'package:app_mobile_horosope/features/auth/bloc/auth_bloc.dart';
import 'package:app_mobile_horosope/icons/custom_icons_icons.dart';
import 'package:app_mobile_horosope/navigator/main_navigator.dart';
import 'package:app_mobile_horosope/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPassword = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hello',
                          style: TextStyle(
                            color: AppPallete.purple500,
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            height: 0.8,
                          ),
                        ),
                        const Text(
                          'there!',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          'Find your destiny written in the stars. Sign up now to reveal your future',
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
                          onTap: () {},
                          child: const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'By signing up, you agree to our ',
                                  style: TextStyle(
                                    color: AppPallete.gray400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Terms of Service ',
                                  style: TextStyle(
                                    color: AppPallete.purple500,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(text: 'and ', style: TextStyle(color: AppPallete.gray400)),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    color: AppPallete.purple500,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SpaceH24(),
                        CustomButton(
                            title: 'Sign up',
                            onPressed: () {
                              context.read<AuthBloc>().add(
                                  RegistrationEvent(email: _emailController.text, password: _passwordController.text));
                            }),
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
                        //   Container(
                        //     decoration: BoxDecoration(
                        //       border: Border.all(color: AppPallete.gray100),
                        //       borderRadius: BorderRadius.circular(12.0),
                        //     ),
                        //     height: 52,
                        //     child: Theme(
                        //       data: ThemeData(
                        //         cupertinoOverrideTheme: const CupertinoThemeData(
                        //           primaryColor: AppPallete.white,
                        //         ),
                        //       ),
                        //       child: CupertinoButton.filled(
                        //         borderRadius: BorderRadius.circular(12.0),
                        //         onPressed: () {
                        //           AppNotifications.errorSnackBar('Not implemented');
                        //         },
                        //         child: const Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Icon(
                        //               CustomIcons.apple,
                        //               color: Color(0xFF000000),
                        //             ),
                        //             SpaceW8(),
                        //             Text(
                        //               'Continue with Apple',
                        //               style: TextStyle(
                        //                 color: Color(0xFF000000),
                        //                 fontWeight: FontWeight.w600,
                        //                 fontSize: 16,
                        //               ),
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 4,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          MainNavigator.pop();
                        },
                        child: const Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Already have and account? ', style: TextStyle(color: AppPallete.gray400)),
                                TextSpan(
                                  text: 'Sign in',
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
