import 'package:flutter/material.dart';
import 'package:the_movie/common/util/format_util.dart';
import 'package:the_movie/data/model/movie_model.dart';
import 'package:the_movie/presentation/themes/theme_color.dart';
import 'package:the_movie/presentation/themes/theme_text.dart';

class BottomItemMovie extends StatelessWidget {
  final MovieModel movieModel;
  const BottomItemMovie({Key? key, required this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            FormatUtils.convertDateTime(movieModel.releaseDate),
            maxLines: 2,
            style: AppTextTheme.style18pxGrey.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: AppColors.white),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            movieModel.originalTitle ?? '',
            maxLines: 2,
            style: AppTextTheme.style18pxGrey.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: AppColors.white),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
