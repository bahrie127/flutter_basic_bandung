import 'package:flutter/material.dart';
import 'package:flutter_basic/data/remote_datasource.dart';

import '../models/album.dart';

class Sliver2Page extends StatefulWidget {
  const Sliver2Page({super.key});

  @override
  State<Sliver2Page> createState() => _SliverPageState();
}

class _SliverPageState extends State<Sliver2Page> {
  bool pinned = true;
  bool snap = true;
  bool floating = true;

  List<Album> listAlbum = [];

  bool isLoading = false;

  TextEditingController nameAlbumController = TextEditingController();

  @override
  void initState() {
    refeshData();
    super.initState();
  }

  void refeshData() async {
    setState(() {
      isLoading = true;
    });
    listAlbum = await RemoteDatasource().getAlbums();
    setState(() {
      isLoading = false;
    });
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
            isLoading
                ? SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return const CircularProgressIndicator.adaptive();
                    }, childCount: 1),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final album = listAlbum[index];
                      return Card(
                        child: ListTile(
                          title: Text(album.title),
                          subtitle: Text(album.userId.toString()),
                          leading: CircleAvatar(child: Text('${album.id}')),
                          trailing: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    nameAlbumController.text = album.title;
                                    return AlertDialog(
                                      title: const Text('Edit Album'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: nameAlbumController,
                                            decoration: const InputDecoration(
                                                labelText: 'Album Name'),
                                          )
                                        ],
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () async {
                                            final model = Album(
                                              userId: 1,
                                              title: nameAlbumController.text,
                                              id: album.id,
                                            );
                                            final newAlbum =
                                                await RemoteDatasource()
                                                    .updateAlbum(model);
                                            listAlbum.insert(0, newAlbum);
                                            setState(() {});
                                            nameAlbumController.clear();
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'Update Data ${newAlbum.title} berhasil'),
                                                backgroundColor: Colors.blue,
                                              ),
                                            );
                                          },
                                          child: const Text('Simpan'),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: const Text('Edit'),
                          ),
                        ),
                      );
                    }, childCount: listAlbum.length),
                  )

            // FutureBuilder<List<Album>>(
            //   future: futureAlbum,
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return SliverList(
            //         delegate: SliverChildBuilderDelegate((context, index) {
            //           final album = snapshot.data![index];
            //           return Card(
            //             child: ListTile(
            //               title: Text(album.title),
            //               subtitle: Text(album.userId.toString()),
            //               leading: CircleAvatar(child: Text('${album.id}')),
            //               trailing: ElevatedButton(
            //                 onPressed: () {},
            //                 child: const Text('Edit'),
            //               ),
            //             ),
            //           );
            //         }, childCount: snapshot.data!.length),
            //       );
            //     }

            //     if (snapshot.hasError) {
            //       print('error: ${snapshot.error.toString()}');
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text(snapshot.error.toString()),
            //           backgroundColor: Colors.red,
            //         ),
            //       );
            //     }

            //     return SliverList(
            //         delegate: SliverChildBuilderDelegate((context, index) {
            //       return const CircularProgressIndicator.adaptive();
            //     }, childCount: 1));
            //   },
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add Album'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: nameAlbumController,
                        decoration:
                            const InputDecoration(labelText: 'Album Name'),
                      )
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () async {
                        final model =
                            Album(userId: 1, title: nameAlbumController.text);
                        final newAlbum =
                            await RemoteDatasource().createAlbum(model);
                        listAlbum.insert(0, newAlbum);
                        setState(() {});
                        nameAlbumController.clear();
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Add Data ${newAlbum.title} berhasil'),
                            backgroundColor: Colors.blue,
                          ),
                        );
                      },
                      child: const Text('Simpan'),
                    ),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
