import 'package:ecommerce/common/widgets/loaders/loaders.dart';
import 'package:ecommerce/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../personalization/controllers/user_controller.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());




  /// Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'Logging you in...', TImages.successIllustration,
      );

      //Check Internet Connectivity
      //final isConnected = await NetworkManager.instance.isConnected();
       //if (!isConnected) {
       //TFullScreenLoader.stopLoading();
       //return;
       //}

      // Form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user Email & Password Authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();



      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Handle error
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      // Show error message or take appropriate action
    }
  }

  /// Google SignIn Authentication
 Future<void> googleSignIn() async {
    try{
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.successIllustration);


      //Check Internet Connectivity
      //final isConnected = await NetworkManager.instance.isConnected();
      //if (!isConnected) {
      //TFullScreenLoader.stopLoading();
      //return;
      //}

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

     // Save user record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch(e){
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());


    }
 }
}