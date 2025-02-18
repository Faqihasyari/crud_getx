import 'package:crud_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import './_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ALL PRODUCT'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
                onPressed: () => Get.toNamed(Routes.ADD), icon: Icon(Icons.add))
          ],
        ),
        body: Obx(
          () => controller.product.isEmpty
              ? Center(
                  child: Text("BELUM ADA"),
                )
              : ListView.builder(
                  itemCount: controller.product.length,
                  itemBuilder: (context, index) {
                    final data = controller.product[index];
                    return ItemView(data);
                  },
                ),
        ));
  }
}
