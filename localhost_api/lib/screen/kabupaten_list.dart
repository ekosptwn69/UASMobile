import 'package:flutter/material.dart';
import 'package:localhost_api/api/api_service.dart';
import 'package:localhost_api/model/kabupaten.dart';
import 'package:localhost_api/model/kabupaten_read.dart';
import 'package:localhost_api/screen/kabupaten_create.dart';

class KabupatenList extends StatefulWidget {
  static const routeName = '/kabupaten_list';

  const KabupatenList({Key? key}) : super(key: key);

  @override
  State<KabupatenList> createState() => _KabupatenListState();
}

class _KabupatenListState extends State<KabupatenList> {
  late Future<KabupatenRead> _future;

  @override
  void initState() {
    super.initState();
    ApiService apiService = ApiService();
    _future = apiService.getKabupaten();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kabupaten'),
      ),
      body: Center(
        child: FutureBuilder<KabupatenRead>(
          future: _future,
          builder: (context, snapshot) {
            var state = snapshot.connectionState;
            if (state != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                final List<kabupaten> kabupatens = snapshot.data!.kirims;
                return ListView.builder(
                    itemCount: kabupatens.length,
                    itemBuilder: (context, index) {
                      return _buildKabupatenCard(context, kabupatens[index]);
                    });
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              } else {
                return const Text('');
              }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, KabupatenCreate.routeName);
        },
      ),
    );
  }

  Widget _buildKabupatenCard(BuildContext context, kabupaten pengiriman) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(
        pengiriman.nama,
      ),
      subtitle: Text(
        pengiriman.luas,
      ),
    );
  }
}
