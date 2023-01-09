import 'package:flutter/material.dart';
import 'package:localhost_api/screen/kabupaten_create.dart';
import 'package:localhost_api/screen/pengiriman_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Kabupaten',
      initialRoute: KabupatenList.routeName,
      routes: {
        KabupatenList.routeName: (context) => const KabupatenList(),
        KabupatenCreate.routeName: (context) => const KabupatenCreate(),
      },
    );
  }
}
