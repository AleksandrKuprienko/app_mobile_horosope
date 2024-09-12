import 'package:app_mobile_horosope/notifications/app_notifications.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.firebaseAuth}) : super(ProfileInitialState()) {
    on<ProfileEvent>((event, emit) {});
  }

  final FirebaseAuth firebaseAuth;

  void updatePhotoUrl({required String photoUrl}) async {
    try {
      await firebaseAuth.currentUser?.updatePhotoURL(photoUrl);
      AppNotifications.successSnackBar('Avatar updated.');
    } on Object catch (_) {
      AppNotifications.errorSnackBar('Something goes wrong, try again.');
    }
  }

  void updateDisplayName({required String displayName}) async {
    try {
      await firebaseAuth.currentUser?.updateDisplayName(displayName);
      firebaseAuth.currentUser?.reload();
      AppNotifications.successSnackBar('Name updated.');
    } on Object catch (_) {
      AppNotifications.errorSnackBar('Something goes wrong, try again.');
    }
  }
}
