import 'package:crud_getx/app/modules/home/controllers/home_controller.dart';
import 'package:crud_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ItemView extends GetView<HomeController> {
  ItemView(this.data);
  final data;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed(Routes.EDIT, arguments: data.id!),
      leading: CircleAvatar(),
      title: Text(data.name!),
      subtitle: Text(data.createAt!),
      trailing: IconButton(
          onPressed: () {
            controller.delete(data.id!);
          },
          icon: Icon(Icons.delete)),
    );
  }
}
