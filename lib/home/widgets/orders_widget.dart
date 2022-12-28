import 'package:bantuone_admin/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../order/order_binding.dart';
import '../../order/order_screen.dart';

class OrdersWidget extends GetView<HomeController> {
  OrdersWidget({super.key});

  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Obx(
        () => ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: controller.orders.length,
          itemBuilder: (context, index) {
            final history = controller.orders[index];
            return Card(
              child: InkWell(
                onTap: () => history['step'] > 1
                    ? Get.to(() => const OrderScreen(),
                        binding: OrderBinding(), arguments: history['id'])
                    : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Text('Destination: ${history['destinationName']}')
                        ],
                      ),
                      subtitle: Text('${history['destinationAddress']}'),
                    ),
                    Visibility(
                      visible: history['step'] == 1,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () =>
                                  controller.updateStep(history['id'], -2),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              child: const Text('Tolak'),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton(
                              onPressed: () => controller.updateStep(
                                  history['id'], history['step'] + 1),
                              child: const Text('Terima'),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
