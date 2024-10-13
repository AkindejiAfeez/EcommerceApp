import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_executions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';



class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      // If the user is logged in
      if (user.emailVerified) {
        // If the user's email is verified, navigate to the main menu
        Get.offAll(() => const NavigationMenu());
      } else {
        // If not Navigate to VerifyEmail
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);


      // Check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  // --------- Email & Password Sign-In
  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email,
      String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
    }

    /// [EmailAuthentication] Register
    Future<UserCredential> registerWithEmailAndPassword(String email,
        String password) async {
      try {
        return await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      } on FirebaseAuthException catch (e) {
        throw TFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
        throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
        throw TFormatException();
      } on PlatformException catch (e) {
        throw TPlatformException(e.code).message;
      } catch (e) {
        throw 'Something went wrong. Please try again';
      }
    }

    /// EMAIL VERIFICATION
    Future<void> sendEmailVerification() async {
      try {
        await _auth.currentUser?.sendEmailVerification();
      } on FirebaseAuthException catch (e) {
        throw TFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
        throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
        throw const TFormatException();
      } on PlatformException catch (e) {
        throw TPlatformException(e.code).message;
      } catch (e) {
        throw 'Something went wrong. Please try again';
      }
    }

  /// GoogleAuthentication
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain Auth details from the request
      final GoogleSignInAuthentication? googleAuth = await  userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken);

      // Once signed in return UserCredentials
      return await _auth.signInWithCredential(credentials);


    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

    /// LOGOUT USER
    Future<void> logout() async {
      try {
        await FirebaseAuth.instance.signOut();
        Get.offAll(() => const LoginScreen());
      } on FirebaseAuthException catch (e) {
        throw TFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
        throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
        throw const TFormatException();
      } on PlatformException catch (e) {
        throw TPlatformException(e.code).message;
      } catch (e) {
        throw 'Something went wrong. Please try again';
      }
    }
  }

