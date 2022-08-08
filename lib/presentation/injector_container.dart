
import 'package:get_it/get_it.dart';
import 'package:the_movie/common/network/client.dart';
import 'package:the_movie/data/respository/the_movie_repository.dart';
import 'package:the_movie/data/respository_impl/the_movie_repository_impl.dart';

import 'screen/the_movie_screen/cubit/the_movie_cubit.dart';

final injector = GetIt.instance;

Future<void> init() async {

  _configureBlocs();
  _configureRepositories();
  _initCommon();
}

void _configureBlocs() {
  injector.registerFactory(() => TheMovieCubit(
        injector(),
      ));
}


void _configureRepositories() {
  injector.registerFactory<TheMovieRepository>(
      () => TheMovieRepositoryImpl(
            injector()
          ));
}

void _initCommon() {
  injector.registerLazySingleton(() => AppClient());
}
