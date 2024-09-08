import 'package:app_mobile_horosope/components/spacers.dart';
import 'package:app_mobile_horosope/features/auth/bloc/auth_bloc.dart';
import 'package:app_mobile_horosope/icons/custom_icons_icons.dart';
import 'package:app_mobile_horosope/navigator/main_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(400.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello ${context.read<AuthBloc>().firebaseAuth.currentUser?.displayName ?? ''}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 36, fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Text(
                                DateFormat('EEEE').format(DateTime.now()).toString(),
                                style: const TextStyle(
                                  color: Color(0xFFDBD5F3),
                                  fontSize: 16,
                                ),
                              ),
                              const Text(
                                ', ',
                                style: TextStyle(
                                  color: Color(0xFFDBD5F3),
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                DateFormat.yMMMMd().format(DateTime.now()).toString(),
                                style: const TextStyle(
                                  color: Color(0xFFDBD5F3),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SpaceH24(),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF9280DB),
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
                                              color: Color(0xFFFFFFFF), fontSize: 16, fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Daily horoscope',
                                          style: TextStyle(
                                            color: Color(0xFFDBD5F3),
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
              ),
              toolbarHeight: 64,
              elevation: 0,
              centerTitle: false,
              actions: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color(0xFF9280DB),
                  ),
                  child: const IconButton(
                    highlightColor: Colors.transparent,
                    iconSize: 24,
                    icon: Icon(
                      CustomIcons.settings,
                      color: Color(0xFFFFFFFF),
                    ),
                    onPressed: MainNavigator.profilePage,
                  ),
                ),
                const SpaceW10(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color(0xFF9280DB),
                  ),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    icon: Image.network(context.read<AuthBloc>().getUser?.photoURL ?? '', errorBuilder: (c, _, s) {
                      return const Icon(
                        CustomIcons.user,
                        color: Colors.white,
                      );
                    }),
                    onPressed: MainNavigator.profilePage,
                  ),
                ),
                const SpaceW16(),
              ],
              title: SvgPicture.asset(
                'assets/images/logo.svg',
                height: 26,
                width: 110,
              ),
              backgroundColor: const Color(0xFF6E56CF),
            )
          ];
        },
        body: Column(
          children: [
            Container(
              height: 84,
              margin: const EdgeInsets.all(10),
              color: const Color(0xFFE3E5EA),
              child: const Center(child: Text('advertisment')),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: const Color(0xFFF7F8FB),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lunar Calendar',
                    style: TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: const Color(0xFF6E56CF),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            children: [
              Icon(
                CustomIcons.stars,
                color: Color(0xFFFFFFFF),
              ),
              Text(
                'New horoscope',
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        onPressed: () => context.read<AuthBloc>().add(const LogoutEvent()),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
