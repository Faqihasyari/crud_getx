import 'package:crud_getx/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD PRODUCT'),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              autocorrect: false,
              controller: controller.name,
              decoration: InputDecoration(
                  labelText: "Nama Produk",
                  hintText: "Masukkan Nama Produk",
                  border: OutlineInputBorder()),
              onEditingComplete: () =>
                  Get.find<HomeController>().add(controller.name.text),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.find<HomeController>().add(controller.name.text);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                ),
                child: Text("Tambahkan Produk"))
          ],
        ),
      )),
    );
  }
}
