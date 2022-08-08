import 'package:the_movie/common/network/client.dart';
import 'package:the_movie/common/network/configs.dart';
import 'package:the_movie/data/model/movie_model.dart';
import 'package:the_movie/data/respository/the_movie_repository.dart';

class TheMovieRepositoryImpl implements TheMovieRepository {

  final AppClient appClient;

  TheMovieRepositoryImpl(this.appClient);


  @override
  Future<List<MovieModel>> getDataMovie({int? take}) async {
    List<MovieModel> result = [];
    int page = take ?? 1;
    final data = await appClient
        .get('movie?api_key=${Configurations.apiKey}&page=$page');
    data['results'].forEach((e) {
      result.add(MovieModel.fromJson(e));
    });
    return result;
  }

}
