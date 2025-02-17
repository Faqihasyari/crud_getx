import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_controller.dart';

class EditView extends GetView<EditController> {
  const EditView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
