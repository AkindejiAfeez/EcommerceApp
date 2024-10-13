import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../common/widgets/loaders/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen(_updateConnectionStatus) as StreamSubscription<ConnectivityResult>;
  }


  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    final ConnectivityResult result = results.firstWhere(
          (result) => result != ConnectivityResult.none,
      orElse: () => ConnectivityResult.none,
    );

    _connectionStatus.value = result;
    if (result == ConnectivityResult.none) {
      TLoaders.warningSnackBar(title: 'No Internet Connection');
    }
}

Future<bool> isConnected() async {
  try {
    final result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  } on PlatformException catch (_) {
    return false;
  }
  }

  @override
  void onClosed() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
