import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_gallery/const.dart';
import 'package:simple_gallery/data/models.dart';

abstract class Api {

  static Future<Iterable<Album>> getAlbums() async {
    final url = Const.apiUrl + "/albums";
    final response = await http.get(url);
    return (jsonDecode(response.body) as List).map((e) => Album.fromJson(e));
  }

  static Future<Iterable<Post>> getPosts() async {
    final url = Const.apiUrl + "/posts";
    final response = await http.get(url);
    return (jsonDecode(response.body) as List).map((e) => Post.fromJson(e));
  }

  static Future<Iterable<User>> getUsers() async {
    final url = Const.apiUrl + "/users";
    final response = await http.get(url);
    return (jsonDecode(response.body) as List).map((e) => User.fromJson(e));
  }
}
