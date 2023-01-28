import 'package:bantuone_admin/controllers/home_controller.dart';
import 'package:bantuone_admin/service_add/service_add_binding.dart';
import 'package:bantuone_admin/service_add/service_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service_edit/service_edit_binding.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff14274E),
          title: const Text('Hai Admin!', style: TextStyle(fontWeight: FontWeight.bold),),
          bottom: controller.currentIndex.value == 0
              ? TabBar(
                  controller: controller.tabController,
                  tabs: const [
                    Tab(
                      child: Text('Diterima'),
                    ),
                    Tab(
                      child: Text('Berlangsung'),
                    ),
                    Tab(
                      child: Text('Selesai'),
                    ),
                  ],
                  onTap: (value) => controller.getOrders(),
                )
              : null,
          actions: controller.currentIndex.value == 1
              ? [
                  IconButton(
                    onPressed: () => Get.to(() => const ServiceAddScreen(),
                        binding: ServiceAddBinding()),
                    icon: const Icon(Icons.add),
                  )
                ]
              : null,
        ),
        body: Obx(
          () => controller.getCurrentWidget(),
        ),
        bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Obx(
      () => BottomNavigationBar(
          selectedItemColor: const Color(0xff14274E),
          currentIndex: controller.currentIndex.value,
          onTap: (value) => controller.currentIndex(value),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.document_scanner_sharp), label: 'Pesanan'),
            BottomNavigationBarItem(
                icon: Icon(Icons.apartment_outlined), label: 'Bantuan'),
          ]),
    );
  }
}
