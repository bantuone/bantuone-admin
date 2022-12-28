import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class CustomAppBar {

  static AppBar standardAppbar(String title) {
    return AppBar(
      title: Text(title),
      backgroundColor: const Color(0xff14274E),
    );
  }
}