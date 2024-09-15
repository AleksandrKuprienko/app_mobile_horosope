import 'package:app_mobile_horosope/components/spacers.dart';
import 'package:app_mobile_horosope/features/auth/bloc/auth_bloc.dart';
import 'package:app_mobile_horosope/features/profile/bloc/profile_bloc.dart';
import 'package:app_mobile_horosope/icons/custom_icons_icons.dart';
import 'package:app_mobile_horosope/navigator/main_navigator.dart';
import 'package:app_mobile_horosope/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.gray100,
      appBar: AppBar(
        backgroundColor: AppPallete.gray100,
        leadingWidth: 100,
        leading: IconButton(
          highlightColor: Colors.transparent,
          icon: const Row(
            children: [
              Icon(
                CustomIcons.arrow_left_alt,
                color: AppPallete.gray500,
              ),
              SpaceW10(),
              Text(
                'Back',
                style: TextStyle(
                  color: AppPallete.gray500,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          onPressed: () => MainNavigator.pop(),
        ),
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
          ),
          _buildSettingsGroup([
            _buildSwitchTile('Notifications', CustomIcons.notifications),
            _buildNavigationTile('Payments', CustomIcons.account_balance_wallet, () {}),
            _buildNavigationTile('Privacy & Safety', CustomIcons.encrypted, () {}),
          ]),
          _buildSettingsGroup([
            _buildNavigationTile(
              'Support',
              CustomIcons.help,
              () {},
              trailing: const Icon(
                CustomIcons.north_east,
                color: AppPallete.gray300,
              ),
            ),
            _buildNavigationTile('Feedback', CustomIcons.mail, () {}),
          ]),
          _buildSettingsGroup([
            _buildTextTile('Delete account', CustomIcons.delete, () {
              context.read<ProfileBloc>().deleteAccount();
            }, color: const Color(0xFFE5484D)),
          ]),
          _buildSettingsGroup([
            _buildTextTile(
              'Log out',
              CustomIcons.logout,
              () {
                context.read<AuthBloc>().firebaseAuth.signOut();
              },
              color: AppPallete.gray500,
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder(
                future: PackageInfo.fromPlatform(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      'Version ${snapshot.data?.version}',
                      style: const TextStyle(color: AppPallete.gray500),
                    );
                  }
                  return const SizedBox.shrink();
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> children) {
    return Card(
      color: AppPallete.white,
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(children: children),
    );
  }

  Widget _buildSwitchTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: AppPallete.purple500),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Switch(
        value: true,
        onChanged: (_) {},
      ),
    );
  }

  Widget _buildNavigationTile(String title, IconData icon, void Function()? onTap, {Widget? trailing}) {
    return ListTile(
      splashColor: Colors.transparent,
      enableFeedback: true,
      onTap: onTap,
      leading: Icon(icon, color: AppPallete.purple500),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing ??
          const Icon(
            CustomIcons.chevron_forward,
            color: AppPallete.gray300,
          ),
    );
  }

  Widget _buildTextTile(String title, IconData icon, void Function()? onTap, {Color? color}) {
    return ListTile(
      enableFeedback: true,
      onTap: onTap,
      leading: Icon(icon, color: color ?? AppPallete.purple500),
      title: Text(title, style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w500)),
    );
  }
}
