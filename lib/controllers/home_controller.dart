import 'dart:developer';

import 'package:bantuone_admin/home/widgets/orders_widget.dart';
import 'package:bantuone_admin/home/widgets/services_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final currentIndex = 0.obs;
  final services = <Map<String, dynamic>>[].obs;
  final orders = <Map<String, dynamic>>[].obs;

  getServices() {
    final firestore = FirebaseFirestore.instance;
    firestore.collection('services').snapshots().listen((event) {
      services.clear();

      for (var element in event.docs) {
        final data = element.data();
        data['id'] = element.id;
        services.add(data);
      }
    }).onError((e) {
      e as FirebaseException;

      Get.snackbar('Error', e.message.toString());
    });
  }

  Widget getCurrentWidget() {
    final widgest = [OrdersWidget(), const ServicesWidget()];

    return widgest[currentIndex.value];
  }

  deleteData(String id) {
    final firestore = FirebaseFirestore.instance;
    firestore.collection('services').doc(id).delete();
  }

  getOrders() {
    final firestore = FirebaseFirestore.instance;
    final currentIndex = tabController.index;
    var step = [1];

    if (currentIndex == 1) {
      step = [2, 3, 4];
    } else if (currentIndex == 2) {
      step = [5];
    }

    firestore
        .collection('orders')
        .where('step', whereIn: step)
        .orderBy('createdAt')
        .snapshots()
        .listen((event) {
      orders.clear();

      for (var element in event.docChanges) {
        final data = element.doc.data();
        data!['id'] = element.doc.id;
        orders.add(data);
      }
    }).onError(
      (e) => Get.snackbar('Error', e.message.toString()),
    );
  }

  updateStep(String id, int newStep) {
    final firestore = FirebaseFirestore.instance;
    firestore
        .collection('orders')
        .doc(id)
        .update({'step': newStep})
        .then(
          (value) => getOrders(),
        )
        .catchError(
          (e) => Get.snackbar(
            'Error',
            e.message.toString(),
          ),
        );
  }

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    getOrders();
    super.onInit();
  }
}
