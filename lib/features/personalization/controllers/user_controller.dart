
import 'package:ecommerce/common/widgets/loaders/loaders.dart';
import 'package:ecommerce/data/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../authentication/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  //GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch User record
Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally{
      profileLoading.value = false;
    }
}

  /// Save user record from any Registration provider
Future<void> saveUserRecord(UserCredential? userCredentials) async {
  try {
    if (userCredentials != null) {
      // convert Name to First and Last Name
      final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
      final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

      // Map Data
      final user = UserModel(
          id: userCredentials.user!.uid,
          username: username,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
      );

      // Save user data
      await userRepository.saveUserRecord(user);
    }
  } catch (e) {
    TLoaders.warningSnackBar(title: 'Data not saved',
      message: 'Something went wrong while saving your information. You can re-save your data in your Profile',
    );
  }
}
}