import 'package:bantuone_admin/home/home_binding.dart';
import 'package:bantuone_admin/home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final detail = <String, dynamic>{}.obs;

  final steps = [
    'Mohon tunggu sampai mendapatkan bantuan darurat!',
    'Pesanan sudah diterima, mohon menunggu!',
    'Bantuan sedang menuju tempat anda!',
    'Bantuan sudah sampai di tempat anda!',
    'Pesanan anda selesai! Terima kasih!'
  ];
  final stepImages = [
    'assets/loading.png',
    'assets/accepted.png',
    'assets/onTheWay.png',
    'assets/arrived.png',
    'assets/done.png'
  ];
  final nextStep = [
    '',
    'Sedang menuju lokasi',
    'Sudah sampai di lokasi',
    'Pesanan selesai',
    ''
  ];

  getDetail() {
    detail.clear();

    final id = Get.arguments;
    final firestore = FirebaseFirestore.instance;
    firestore.collection('orders').doc(id).snapshots().listen((value) async {
      final data = value.data();

      if (data!['step'] == -1) {
        Get.back();
        Get.snackbar('Alert', 'Order canceled!');
      }

      data['id'] = value.id;
      data['userAddress'] = await _parseLocation(
        data['userLat'],
        data['userLng'],
      );
      data['destinationAddress'] = await _parseLocation(
        data['destinationLat'],
        data['destinationLng'],
      );

      detail.addAll(data);
    }).onError((e) {
      e as FirebaseException;

      Get.back();
      Get.snackbar(
        'Error',
        e.message.toString(),
      );
    });
  }

  String getStepMsg() {
    final step = detail['step'] - 1;
    return steps[step > -1 ? step : 0];
  }

  String getImage() {
    final step = detail['step'] - 1;
    return stepImages[step > -1 ? step : 0];
  }

  String getNextStep() {
    final step = detail['step'] - 1;
    return nextStep[step > -1 ? step : 0];
  }

  _parseLocation(double lat, double lng) async {
    final address = await placemarkFromCoordinates(lat, lng);
    final place = address.first;

    return '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  }

  cancelOrder() {
    final firestore = FirebaseFirestore.instance;
    firestore
        .collection('orders')
        .doc(detail['id'])
        .update({'step': -1})
        .then(
          (value) => Get.offAll(
            () => const HomeScreen(),
            binding: HomeBinding()
          ),
        )
        .catchError((e) {
          Get.snackbar('Error', e.message.toString());
        });
  }

  updateStep() {
    final firestore = FirebaseFirestore.instance;
    firestore
        .collection('orders')
        .doc(detail['id'])
        .update({'step': detail['step'] + 1}).catchError((e) {
      Get.snackbar('Error', e.message.toString());
    });
  }
}
