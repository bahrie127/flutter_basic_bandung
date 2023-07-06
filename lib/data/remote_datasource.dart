import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/album.dart';

class RemoteDatasource {
  Future<List<Album>> getAlbums() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if (response.statusCode == 200) {
      final listObject = jsonDecode(response.body);
      List<Album> albums =
          List<Album>.from(listObject.map((e) => Album.fromMap(e)));
      return albums;
    } else {
      throw Exception('get gagal');
    }
  }
}
