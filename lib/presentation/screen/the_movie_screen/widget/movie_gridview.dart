import 'dart:math';

import 'package:flutter/material.dart';
import 'package:the_movie/data/model/movie_model.dart';
import 'package:the_movie/presentation/themes/theme_color.dart';
import 'package:the_movie/presentation/screen/the_movie_screen/widget/item_movie_widget.dart';

class MovieGridview extends StatelessWidget {
  final List<MovieModel> movieModels;
  final bool limitItem;
  final bool ableScroll;
  final ScrollController? controller;
  final Function(MovieModel oldModel)? onItemTap;
  final Color backgroundColor;

  const MovieGridview({
    Key? key,
    this.ableScroll = false,
    this.limitItem = false,
    this.controller,
    this.onItemTap,
    required this.movieModels,
    this.backgroundColor = AppColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (movieModels.isEmpty) {
      return const SizedBox();
    }
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: GridView.builder(
        itemCount: limitItem ? min(movieModels.length, 6) : movieModels.length,
        shrinkWrap: !ableScroll,
        physics: ableScroll
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),

        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisExtent: 240,
        ),
        itemBuilder: (context, index) {
          return ItemMovieWidget(
            movieModel: movieModels[index],
            onItemTap: onItemTap,
          );
        },
      ),
    );
  }
}