import 'package:app_mobile_horosope/components/spacers.dart';
import 'package:app_mobile_horosope/features/auth/bloc/auth_bloc.dart';
import 'package:app_mobile_horosope/icons/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FB),
      appBar: AppBar(
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
            backgroundImage: NetworkImage(context.read<AuthBloc>().getUser?.photoURL ?? ''),
            child: const Icon(CustomIcons.scorpio),
          ),
          const SpaceH20(),
          Text(
            context.read<AuthBloc>().getUser?.displayName ?? '',
            style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF202020), fontSize: 28),
            textAlign: TextAlign.center,
          ),
          Text(
            context.read<AuthBloc>().getUser?.email ?? '',
            style: const TextStyle(fontWeight: FontWeight.w400, color: Color(0xFF646D7B), fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
