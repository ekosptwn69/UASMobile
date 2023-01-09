import 'package:flutter/material.dart';
import 'package:localhost_api/api/api_service.dart';

class KabupatenCreate extends StatefulWidget {
  static const routeName = '/kabupaten_create';
  const KabupatenCreate({Key? key}) : super(key: key);

  @override
  State<KabupatenCreate> createState() => _KabupatenCreateState();
}

class _KabupatenCreateState extends State<KabupatenCreate> {
  String _id = '';
  String _nama = '';
  String _luas = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kabupaten'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Ketikkan nama kabupaten',
                  labelText: 'Input kabupaten',
                ),
                onChanged: (String value) {
                  setState(() {
                    _nama = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Tuliskan luas',
                  labelText: 'Input luas',
                ),
                onChanged: (String value) {
                  setState(() {
                    _luas = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  ApiService apiService = ApiService();
                  apiService.createKabupaten(_id, _nama, _luas);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}
