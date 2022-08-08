import 'package:the_movie/data/model/movie_model.dart';

abstract class TheMovieState {
  final List<MovieModel>? movies;
  final bool isLastData;

  TheMovieState({this.movies, this.isLastData = false});
}

class TheMovieInitState extends TheMovieState{}

class TheMovieGettingState extends TheMovieState{}

class TheMovieGotDataState extends TheMovieState{
  TheMovieGotDataState(List<MovieModel>? movies, {bool isLastData = false})
      : super(
    movies: movies,
    isLastData: isLastData,
  );
}

class TheMovieLoadingMoreState extends TheMovieState {
  TheMovieLoadingMoreState(List<MovieModel>? movies)
      : super(
    movies: movies,
  );
}