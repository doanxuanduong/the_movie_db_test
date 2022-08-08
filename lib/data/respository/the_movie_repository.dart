import 'package:the_movie/data/model/movie_model.dart';

abstract class TheMovieRepository {
  Future<List<MovieModel>> getDataMovie({int? take});
}
