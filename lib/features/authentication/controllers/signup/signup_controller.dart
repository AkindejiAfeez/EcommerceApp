
import 'package:ecommerce/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:ecommerce/data/repositories/user_repository.dart';
import 'package:ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
 final email = TextEditingController(); // for email input
  final lastName = TextEditingController(); // lastname input
  final username = TextEditingController(); // for username input
  final firstName = TextEditingController(); // for first name input
  final password = TextEditingController(); // for password input
  final phoneNumber = TextEditingController(); // for phone number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // form key for form validation


/// SIGNUP


void signup() async {
  try {
    // Start Loading
    TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.successIllustration);


// Check Internet Connectivity
  //final isConnected = await NetworkManager.instance.isConnected();
  //if (!isConnected) {
    //   TFullScreenLoader.stopLoading();
    //   return; }


// Form Validation
if(!signupFormKey.currentState!.validate()) {
  TFullScreenLoader.stopLoading();
  return;
}

// Privacy Policy check
  if (!privacyPolicy.value) {
    TLoaders.warningSnackBar(title: 'Accept Privacy Policy',
      message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of use.',
    );
    return;
  }

// Register user in the firebase Authentication & Save user data in the firebase
  final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

// Save Authenticated user data in the firebase Firestore
  final newUser = UserModel(
    id: userCredential.user!.uid,
    username: username.text.trim(),
    firstName: firstName.text.trim(),
    lastName: lastName.text.trim(),
    email: email.text.trim(),
    phoneNumber: phoneNumber.text.trim(),
    profilePicture: '',
  );

  final userRepository = Get.put(UserRepository());
  await userRepository.saveUserRecord(newUser);

  // Remove Loader
  TFullScreenLoader.stopLoading();

// show Success Message
  TLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue');

// Move to verify Email Screen

  Get.to(() =>  VerifyEmailScreen(email: email.text.trim()));

  } catch (e) {

    // Remove Loader
    TFullScreenLoader.stopLoading();


    // Show some generic error to the user
  TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  }
}
}