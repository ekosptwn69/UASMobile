import 'package:localhost_api/model/kabupaten.dart';

class KabupatenRead {
  KabupatenRead({required this.success, required this.kirims});

  bool success;
  List<Kabupaten> kirims;

  factory KabupatenRead.fromJson(Map<String, dynamic> json) => KabupatenRead(
      success: json['success'],
      kirims:
          List<kabupaten>.from(json['data'].map((x) => kabupaten.fromJson(x))));
}
