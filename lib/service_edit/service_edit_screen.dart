import 'package:bantuone_admin/constants/colors.dart';
import 'package:bantuone_admin/controllers/service_add_controller.dart';
import 'package:bantuone_admin/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/service_edit_controller.dart';

class ServiceEditScreen extends GetView<ServiceEditController> {
  ServiceEditScreen({super.key});

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.initData(data);
    
    return Scaffold(
      appBar: CustomAppBar.standardAppbar('Edit Bantuan'),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: TextFormField(
              controller: controller.nameCtr,
              decoration: const InputDecoration(
                label: Text('Nama'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: TextFormField(
              controller: controller.addressCtr,
              decoration: const InputDecoration(
                label: Text('Alamat'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: TextFormField(
              controller: controller.latLngCtr,
              decoration: const InputDecoration(
                  label: Text('Lat/Lng'), hintText: 'Lat/Lng'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Obx(
              () => DropdownButton(
                value: controller.selectedType.value,
                items: controller.types
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (value) => controller.selectedType(value),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: TextFormField(
              controller: controller.phoneCtr,
              decoration: const InputDecoration(
                label: Text('Nomor Telepon'),
                hintText: '8xxxxxxxxxxx',
                prefix: Text('+62'),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Obx(
            () => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: green
                ),
                onPressed: () => controller.isLoading.value
                    ? null
                    : controller.editService(data['id']),
                child: controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text('Selesai'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
