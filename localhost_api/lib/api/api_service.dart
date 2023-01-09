import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:localhost_api/model/kabupaten_read.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1/UasApi/api/';

  Future<KabupatenRead> getKabupaten() async {
    final response = await http.get(Uri.parse("${baseUrl}kabupaten/read.php"));
    if (response.statusCode == 200) {
      return KabupatenRead.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<http.Response> createKabupaten(
      String id, String nama, String luas) async {
    final response = await http.post(
      Uri.parse("${baseUrl}bagian/create.php"),
      body: jsonEncode(<String, String>{'id': id, 'nama': nama, 'luas': luas}),
    );
    return response;
  }
}
