import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<ItemModel>();
  final _moviesFetcher2 = PublishSubject<ItemModel>();
  final _moviesFetcher3 = PublishSubject<ItemModel>();

  Stream<ItemModel> get nowMovies => _moviesFetcher.stream;
  Stream<ItemModel> get upMovies => _moviesFetcher2.stream;
  Stream<ItemModel> get popularMovies => _moviesFetcher3.stream;

  fetchNowMovies() async {
    ItemModel itemModel = await _repository.fetchNowMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  fetchUpMovies() async {
    ItemModel itemModel = await _repository.fetchUpMovies();
    _moviesFetcher2.sink.add(itemModel);
  }

  fetchPopularMovies() async {
    ItemModel itemModel = await _repository.fetchPopularMovies();
    _moviesFetcher3.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
    _moviesFetcher2.close();
    _moviesFetcher3.close();
  }
}

final bloc = MoviesBloc();
