import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_movie/common/network/configs.dart';
import 'package:the_movie/data/model/movie_model.dart';
import 'package:the_movie/presentation/screen/the_movie_screen/widget/bottom_item_movie.dart';
import 'package:the_movie/presentation/screen/the_movie_screen/widget/corner_item_movie.dart';
import 'package:the_movie/presentation/themes/theme_color.dart';
import 'package:the_movie/presentation/widget/custom_gesture_detector.dart';

class ItemMovieWidget extends StatelessWidget {
  final MovieModel movieModel;
  final Function(MovieModel oldModel)? onItemTap;

  const ItemMovieWidget({
    Key? key,
    required this.movieModel,
    this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomGestureDetector(
      onTap: () {
        if (onItemTap != null) {
          onItemTap!(movieModel);
          return;
        }
      },
      child: Container(
        width: 120,
        height: 240,
        decoration: BoxDecoration(
          color: AppColors.red,
          boxShadow: const [
            BoxShadow(
              color: AppColors.grey6,
              blurRadius: 6,
              offset: Offset(0, 8), // Shadow position
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.only(
          bottom: 8,
          top: 8,
        ),
        child: Stack(children: [
          (movieModel.posterPath != null &&
                  movieModel.posterPath != Configurations.hostImage)
              ? ClipRRect(
                  child: Image.network(
                    movieModel.posterPath ?? '',
                    width: 160,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                )
              : const SizedBox(),
          Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: BottomItemMovie(
                movieModel: movieModel,
              )),
          Positioned(
            right: 10,
            top: 10,
            child: CornerItemMovie(
              title: movieModel.voteAverage.toString(),
            ),
          ),
        ]),
      ),
    );
  }
}
