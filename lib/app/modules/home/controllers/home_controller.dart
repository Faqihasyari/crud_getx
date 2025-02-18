import 'package:crud_getx/app/data/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/user_model.dart';

class HomeController extends GetxController {
  var product = List<User>.empty().obs;

  void dialogError(String msg) {
    Get.defaultDialog(
      title: "Terjadi Keasalahan",
      content: Text(
        msg,
        textAlign: TextAlign.center,
      ),
    );
  }

  void add(String name) {
    if (name != '') {
      final date = DateTime.now().toIso8601String();
      UserProvider().postUser(name, date).then((response) {
        final data = User(id: response["name"], name: name, createAt: date);
        product.add(data);
        Get.back();
      });
    } else {
      dialogError("Semua Input Harus Diisi");
    }
  }

  void delete(String id) {
    UserProvider()
        .deleteUser(id)
        .then((_) => product.removeWhere((element) => element.id == id));
  }

  User findById(String id) {
    return product.firstWhere(
      (element) => element.id == id,
    );
  }

  void edit(String id, String name) {
    final index = product.indexWhere((user) => user.id == id);
    if (index == -1) return;

    UserProvider().editUser(id, name).then((_) {
      product[index].name = name;
      product.refresh();
      Get.back();
    }).catchError((error) {
      print("Error: $error");
    });
  }
}
