import 'dart:developer';

import 'package:bantuone_admin/home/home_binding.dart';
import 'package:bantuone_admin/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final usernameCtr = TextEditingController();
  final passwordCtr = TextEditingController();

  final usernameNode = FocusNode();
  final passwordNode = FocusNode();

  login(BuildContext context) {
    if (usernameCtr.text == 'bantuoneAdmin' &&
        passwordCtr.text == 'bantuoneAdmin') {
      Get.off(const HomeScreen(), binding: HomeBinding());
    } else {
      Get.snackbar('Gagal', 'Email / Password salah!').show();
    }
  }
}
