import 'dart:async';
import 'movie_api_provider.dart';
import '../models/item_model.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchNowMovies() => moviesApiProvider.fetchNowMovieList();
  Future<ItemModel> fetchUpMovies() => moviesApiProvider.fetchUpMovieList();
  Future<ItemModel> fetchPopularMovies() =>
      moviesApiProvider.fetchPopularMovieList();
}
