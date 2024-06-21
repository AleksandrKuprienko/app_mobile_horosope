import 'package:app_mobile_horosope/components/spacers.dart';
import 'package:app_mobile_horosope/icons/custom_icons_icons.dart';
import 'package:app_mobile_horosope/notifications/app_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

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
                          const Text(
                            'Hello Guest',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 36, fontWeight: FontWeight.w500),
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
                  child: IconButton(
                    iconSize: 24,
                    icon: const Icon(
                      CustomIcons.settings,
                      color: Color(0xFFFFFFFF),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SpaceW10(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color(0xffcff52c),
                  ),
                  child: IconButton(
                    icon: const SizedBox(),
                    onPressed: () {},
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
            )
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
        onPressed: () {
          // context.read<UserProvider>().logOut();
          AppNotifications.successSnackBar();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
