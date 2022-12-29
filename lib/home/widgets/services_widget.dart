import 'package:bantuone_admin/constants/colors.dart';
import 'package:bantuone_admin/controllers/home_controller.dart';
import 'package:bantuone_admin/service_add/service_add_binding.dart';
import 'package:bantuone_admin/service_edit/service_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesWidget extends GetView<HomeController> {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getServices();

    return Obx(
      () => ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemCount: controller.services.length,
        itemBuilder: (context, index) {
          final service = controller.services[index];

          return _buildListItem(service);
        },
      ),
    );
  }

  Widget _buildListItem(Map<String, dynamic> data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${data['name']}', style: TextStyle(fontWeight: FontWeight.bold, color: darkBlue, fontSize: 15),),
            const SizedBox(height: 8),
            Text('${data['address']}', style: TextStyle(color: midBlue),),
            const SizedBox(height: 8),
            Text('${data['type']}', style: TextStyle(fontWeight: FontWeight.bold, color: green),),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => controller.deleteData(data['id']),
                  child: const Text(
                    'Hapus',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () => Get.to(
                    () => ServiceEditScreen(),
                    arguments: data,
                    binding: ServiceEditBinding(),
                  ),
                  child: const Text('Edit'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
