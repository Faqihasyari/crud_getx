import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class UserProvider extends GetConnect {
  String url =
      "https://getx-cli-55949-default-rtdb.asia-southeast1.firebasedatabase.app/";

  Future<void> editUser(String id, String name) async {
  final response = await http.patch(
    Uri.parse("$url/user/$id.json"), // HARUS ada ID agar tidak menambah data baru
    body: jsonEncode({"name": name}),
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode != 200) {
    throw Exception("Gagal mengedit user");
  }
}

  Future<dynamic> postUser(String name, String date) async {
    final response =
        await post("$url" + ' user.json', {"name": name, "createAt": date});
    return response.body;
  }

  Future<void> deleteUser(String id) async =>
      await delete("$url" + ' user/$id.json');
}
