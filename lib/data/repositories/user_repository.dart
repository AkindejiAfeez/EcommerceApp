import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/repositories/repositories.authentication/authentication_repository.dart';

import 'package:ecommerce/features/authentication/models/user_model.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/format_executions.dart';
import '../../utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to FireStore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message; // Corrected class name
    } on FormatException catch (_) {
      throw const TFormatException(); // Corrected class name
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message; // Corrected class name
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(
          AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message; // Corrected class name
    } on FormatException catch (_) {
      throw const TFormatException(); // Corrected class name
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message; // Corrected class name
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to update user data in Firebase.
Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
} on FirebaseException catch (e) {
throw TFirebaseException(e.code).message; // Corrected class name
} on FormatException catch (_) {
throw const TFormatException(); // Corrected class name
} on PlatformException catch (e) {
throw TPlatformException(e.code).message; // Corrected class name
} catch (e) {
throw 'Something went wrong. Please try again';
}
}
/// Update any field in specific Users Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
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

  /// Function to remove user from firebase.
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message; // Corrected class name
    } on FormatException catch (_) {
      throw const TFormatException(); // Corrected class name
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message; // Corrected class name
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
