import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final apiKey = '894f85fefe8dc4ab4f06625c26622351';

  Future<ItemModel> fetchNowMovieList() async {
    // print("entered");
    final response = await client.get(
        "https://api.themoviedb.org/3/movie/now_playing?api_key=${apiKey}&language=en-US&page=1");
    // print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<ItemModel> fetchUpMovieList() async {
    // print("entered");
    final response = await client.get(
        "https://api.themoviedb.org/3/movie/upcoming?api_key=${apiKey}&language=en-US&page=2");
    // print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<ItemModel> fetchPopularMovieList() async {
    // print("entered");
    final response = await client.get(
        "https://api.themoviedb.org/3/movie/popular?api_key=${apiKey}&language=en-US&page=2");
    // print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
