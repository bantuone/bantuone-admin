import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ServiceAddController extends GetxController {
  final nameCtr = TextEditingController();
  final addressCtr = TextEditingController();
  final latLngCtr = TextEditingController();
  final phoneCtr = TextEditingController();

  final isLoading = false.obs;

  final types = ['Rumah Sakit', 'Damkar', 'Bengkel'];
  final selectedType = 'Rumah Sakit'.obs;

  addService() {
    isLoading(true);

    if (nameCtr.text.isNotEmpty &&
        addressCtr.text.isNotEmpty &&
        latLngCtr.text.isNotEmpty) {
      final firestore = FirebaseFirestore.instance;
      firestore.collection('services').add({
        'name': nameCtr.text,
        'address': addressCtr.text,
        'lat/lng': latLngCtr.text,
        'phone': phoneCtr.text,
        'type': selectedType.value
      }).then((value) {
        Get.back();
        Get.snackbar('Sukses!', 'Service added!');
      }).catchError((e) {
        isLoading(false);

        e as FirebaseException;
        Get.snackbar('Error', e.message.toString());
      });
    }
  }
}
