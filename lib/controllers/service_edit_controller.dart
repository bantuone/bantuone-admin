import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ServiceEditController extends GetxController {
  final nameCtr = TextEditingController();
  final addressCtr = TextEditingController();
  final latLngCtr = TextEditingController();

  final isLoading = false.obs;

  final types = ['Rumah Sakit', 'Damkar', 'Bengkel'];
  final selectedType = 'Rumah Sakit'.obs;

  initData(Map<String, dynamic> data) {
    nameCtr.text = data['name'];
    addressCtr.text = data['address'];
    latLngCtr.text = data['lat/lng'];
    selectedType(data['type']);
  }

  editService(String id) {
    isLoading(true);

    if (nameCtr.text.isNotEmpty &&
        addressCtr.text.isNotEmpty &&
        latLngCtr.text.isNotEmpty) {
      final firestore = FirebaseFirestore.instance;
      firestore.collection('services').doc(id).set({
        'name': nameCtr.text,
        'address': addressCtr.text,
        'lat/lng': latLngCtr.text,
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
