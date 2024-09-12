import 'package:app_mobile_horosope/components/helpers/image_helper.dart';
import 'package:app_mobile_horosope/components/spacers.dart';
import 'package:app_mobile_horosope/features/auth/bloc/auth_bloc.dart';
import 'package:app_mobile_horosope/features/profile/bloc/profile_bloc.dart';
import 'package:app_mobile_horosope/icons/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController displayNameController = TextEditingController();

  String displayName = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    displayNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3E5EA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE3E5EA),
        leadingWidth: 100,
        leading: IconButton(
          highlightColor: Colors.transparent,
          icon: const Row(
            children: [
              Icon(
                CustomIcons.arrow_left_alt,
                color: Color(0xFF646D7B),
              ),
              SpaceW10(),
              Text(
                'Back',
                style: TextStyle(
                  color: Color(0xFF646D7B),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SpaceH20(),
          CircleAvatar(
            radius: 80,
            backgroundImage:
                NetworkImage(context.read<AuthBloc>().firebaseAuth.currentUser?.photoURL ?? ImageHelper.dummyImage),
            child: const Icon(CustomIcons.scorpio),
          ),
          const SpaceH20(),
          Text(
            context.watch<ProfileBloc>().firebaseAuth.currentUser?.displayName ?? displayName,
            style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF202020), fontSize: 28),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            context.read<ProfileBloc>().firebaseAuth.currentUser?.email ?? '',
            style: const TextStyle(fontWeight: FontWeight.w400, color: Color(0xFF646D7B), fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SpaceH32(),
        ],
      ),
    );
  }
}
