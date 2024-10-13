import 'package:ecommerce/features/authentication/controllers/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class GeneralBindings extends Bindings  {

  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
