import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/data/respository/the_movie_repository.dart';
import 'package:the_movie/presentation/screen/the_movie_screen/cubit/the_movie_state.dart';

class TheMovieCubit extends Cubit<TheMovieState> {
  final TheMovieRepository theMovieRepository;
  int page = 1;

  TheMovieCubit(this.theMovieRepository) : super(TheMovieInitState());

  void getDataMovie() async {
    try {
      emit(TheMovieGettingState());
       await Future.delayed(const Duration(seconds: 3));
      var models = await theMovieRepository.getDataMovie(take: page);
      emit(TheMovieGotDataState(models, isLastData: models.length < 20));
    } catch (e) {
      ///print(e);
    }
  }

  void loadMoreDataMovies() async {
    try {
      emit(TheMovieLoadingMoreState(state.movies));
      page += 1;
      var models = await theMovieRepository.getDataMovie(take: page);
      if (models.isNotEmpty) {
        state.movies?.addAll(models);
      }
      emit(TheMovieGotDataState(state.movies, isLastData: models.length < 20));
    } catch (e) {
      ///print(e);
    }
  }
}
