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

  Future<Album> createAlbum(Album model) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      body: model.toJson(),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      return Album.fromJson(response.body);
    } else {
      throw Exception('post gagal');
    }
  }

  Future<Album> updateAlbum(Album model) async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/${model.id}'),
      body: model.toJson(),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return Album.fromJson(response.body);
    } else {
      throw Exception('put gagal');
    }
  }
}
