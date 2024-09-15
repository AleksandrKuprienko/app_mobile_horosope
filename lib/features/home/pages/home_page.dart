import 'package:app_mobile_horosope/components/helpers/image_helper.dart';
import 'package:app_mobile_horosope/components/spacers.dart';
import 'package:app_mobile_horosope/features/auth/bloc/auth_bloc.dart';
import 'package:app_mobile_horosope/features/profile/bloc/profile_bloc.dart';
import 'package:app_mobile_horosope/features/settings/pages/setting_page.dart';
import 'package:app_mobile_horosope/icons/custom_icons_icons.dart';
import 'package:app_mobile_horosope/navigator/main_navigator.dart';
import 'package:app_mobile_horosope/notifications/app_notifications.dart';
import 'package:app_mobile_horosope/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppPallete.white,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(400.0),
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        'assets/images/lines.svg',
                        alignment: Alignment.bottomCenter,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello ${context.watch<ProfileBloc>().firebaseAuth.currentUser?.displayName ?? ''}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      color: Color(0xFFFFFFFF), fontSize: 36, fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      DateFormat('EEEE').format(DateTime.now()).toString(),
                                      style: const TextStyle(
                                        color: AppPallete.purple200,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const Text(
                                      ', ',
                                      style: TextStyle(
                                        color: AppPallete.purple200,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      DateFormat.yMMMMd().format(DateTime.now()).toString(),
                                      style: const TextStyle(
                                        color: AppPallete.purple200,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SpaceH24(),
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: AppPallete.purple400,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFCFF52C),
                                              borderRadius: BorderRadius.circular(24),
                                            ),
                                            child: const Icon(
                                              CustomIcons.scorpio,
                                              size: 28,
                                              color: Color(0xFF202020),
                                            ),
                                          ),
                                          const SpaceW10(),
                                          const Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Scorpio',
                                                style: TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              Text(
                                                'Daily horoscope',
                                                style: TextStyle(
                                                  color: AppPallete.purple200,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      const SpaceH10(),
                                      const Text(
                                        'You’re inclined to trust your intuition with mental Mercury deep-diving through your mysterious eighth house. But the messenger planet’s skirmish with sensible Saturn in your passionate fifth house today advises you to temper your intense desire to make a bold move.',
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SpaceH20(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                toolbarHeight: 64,
                elevation: 0,
                centerTitle: false,
                actions: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: AppPallete.purple400,
                    ),
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      iconSize: 24,
                      icon: const Icon(
                        CustomIcons.settings,
                        color: Color(0xFFFFFFFF),
                      ),
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingPage())),
                    ),
                  ),
                  const SpaceW10(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: AppPallete.purple400,
                    ),
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      icon: Stack(
                        children: [
                          Image.network(
                            context.read<AuthBloc>().firebaseAuth.currentUser?.photoURL ?? ImageHelper.dummyImage,
                            width: 30,
                            height: 30,
                          ),
                          const Badge(
                            label: Icon(
                              CustomIcons.stars,
                              color: AppPallete.white,
                              size: 20,
                            ),
                            backgroundColor: AppPallete.purple400,
                          )
                        ],
                      ),
                      onPressed: MainNavigator.profilePage,
                    ),
                  ),
                  const SpaceW16(),
                ],
                title: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 5000),
                  crossFadeState: CrossFadeState.showSecond,
                  firstChild: Container(),
                  secondChild: SvgPicture.asset(
                    'assets/images/logo.svg',
                    height: 26,
                    width: 110,
                  ),
                ),
                backgroundColor: AppPallete.purple500,
              )
            ];
          },
          body: Column(
            children: [
              Container(
                height: 84,
                margin: const EdgeInsets.all(10),
                color: AppPallete.gray100,
                child: const Center(child: Text('advertisment')),
              ),
              const SpaceH16(),
              // Container(
              //   width: double.maxFinite,
              //   margin: const EdgeInsets.symmetric(horizontal: 12),
              //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(24),
              //     color: const Color(0xFFF7F8FB),
              //   ),
              //   child: const Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         'Lunar Calendar',
              //         style: TextStyle(
              //           color: Color(0xFF202020),
              //           fontSize: 24,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 0,
          backgroundColor: AppPallete.purple500,
          label: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Row(
              children: [
                Icon(
                  CustomIcons.stars,
                  color: Color(0xFFFFFFFF),
                ),
                SpaceW8(),
                Text(
                  'New horoscope',
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          onPressed: () {
            AppNotifications.successSnackBar('Я просто кнопка функціонал буде потім');
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
