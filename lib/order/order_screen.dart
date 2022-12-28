import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'order_controller.dart';

class OrderScreen extends GetView<OrderController> {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getDetail();

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.detail.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                child: ListView(
                  children: [
                    Image.asset(
                      controller.getImage(),
                      width: 96,
                      height: 96,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      controller.getStepMsg(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xff14274E),
                          fontWeight: FontWeight.w400),
                    ),
                    Visibility(
                      visible: controller.detail['step'] < 5,
                      child: ElevatedButton(
                        onPressed: () => controller.updateStep(),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xff14274E),
                          ),
                        ),
                        child: Text(
                          controller.getNextStep(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    _buildLocation(),
                    const Divider(),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xff14274E)),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 56,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.detail['userName'],
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                controller.detail['userAddress'],
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Expanded(child: Text('Menuju titik jemput')),
                          Container(
                            width: 1,
                            height: 24,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 16),
                          const Icon(Icons.call_outlined)
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Visibility(
                      visible: controller.detail['step'] < 5,
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _showDialog(context),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          child: const Text('Batalkan Pesanan'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildLocation() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          _buildLocationItem(
            controller.detail['userName'],
            controller.detail['userAddress'],
            const Icon(
              Icons.location_pin,
              color: Colors.green,
              size: 32,
            ),
          ),
          _buildLocationItem(
            '',
            '',
            const Icon(
              Icons.more_vert,
              color: Colors.black,
              size: 32,
            ),
          ),
          _buildLocationItem(
            controller.detail['destinationName'],
            controller.detail['destinationAddress'],
            const Icon(
              Icons.location_pin,
              color: Colors.red,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationItem(String name, String address, Icon icon) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                address,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _showDialog(BuildContext context) {
    final dialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Batalkan Pesanaan?'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Get.back(),
                    child: const Text('Tidak'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Ya'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (context) => dialog,
    );
  }
}
