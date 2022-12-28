import 'package:bantuone_admin/controllers/service_add_controller.dart';
import 'package:bantuone_admin/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceAddScreen extends GetView<ServiceAddController> {
  const ServiceAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.standardAppbar('Add Service'),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: TextFormField(
              controller: controller.nameCtr,
              decoration: const InputDecoration(
                label: Text('Name'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: TextFormField(
              controller: controller.addressCtr,
              decoration: const InputDecoration(
                label: Text('Address'),
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
          const SizedBox(
            height: 32,
          ),
          Obx(
            () => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>
                    controller.isLoading.value ? null : controller.addService(),
                child: controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text('Add'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
