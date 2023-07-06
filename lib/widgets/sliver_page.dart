import 'package:flutter/material.dart';
import 'package:flutter_basic/data/remote_datasource.dart';

import '../models/album.dart';

class SliverPage extends StatefulWidget {
  const SliverPage({super.key});

  @override
  State<SliverPage> createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> {
  bool pinned = true;
  bool snap = true;
  bool floating = true;

  late Future<List<Album>> futureAlbum;

  @override
  void initState() {
    futureAlbum = RemoteDatasource().getAlbums();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              snap: snap,
              floating: floating,
              pinned: pinned,
              expandedHeight: 150,
              flexibleSpace: const FlexibleSpaceBar(
                centerTitle: false,
                title: Text(
                  'Training Flutter',
                  style: TextStyle(color: Colors.amber),
                ),
                background: FlutterLogo(),
              ),
            ),
            FutureBuilder<List<Album>>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final album = snapshot.data![index];
                      return Card(
                        child: ListTile(
                          title: Text(album.title),
                          subtitle: Text(album.userId.toString()),
                          leading: CircleAvatar(child: Text('${album.id}')),
                          trailing: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Edit'),
                          ),
                        ),
                      );
                    }, childCount: snapshot.data!.length),
                  );
                }
                return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return const CircularProgressIndicator.adaptive();
                }, childCount: 1));
              },
            ),
          ],
        ),
      ),
    );
  }
}
