import 'package:crud_getx/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_controller.dart';

class EditView extends GetView<EditController> {
  final homeC = Get.find<HomeController>();
  EditView({super.key});
  @override
  Widget build(BuildContext context) {
    final data = homeC.findById(Get.arguments);
    controller.name.text = data.name!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('EDIT PRODUCT'),
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
                  labelText: "Edit Nama Produk",
                  hintText: "Masukkan Nama Produk Yang Baru",
                  border: OutlineInputBorder()),
              onEditingComplete: () =>
                  homeC.edit(Get.arguments, controller.name.text),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  homeC.edit(Get.arguments, controller.name.text);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                ),
                child: Text("Edit Produk"))
          ],
        ),
      )),
    );
  }
}
