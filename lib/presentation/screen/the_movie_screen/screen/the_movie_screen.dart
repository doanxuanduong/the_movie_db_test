import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/common/constans/string_constant.dart';
import 'package:the_movie/presentation/injector_container.dart';
import 'package:the_movie/presentation/screen/the_movie_screen/cubit/the_movie_cubit.dart';
import 'package:the_movie/presentation/screen/the_movie_screen/cubit/the_movie_state.dart';
import 'package:the_movie/presentation/themes/theme_color.dart';
import 'package:the_movie/presentation/themes/theme_text.dart';
import 'package:the_movie/presentation/widget/custom_gesture_detector.dart';
import 'package:the_movie/presentation/screen/the_movie_screen/widget/movie_gridview.dart';
import 'package:the_movie/presentation/widget/loading.dart';
import 'package:the_movie/presentation/widget/shimmer/common_shimmer.dart';

class TheMovieScreen extends StatefulWidget {
  const TheMovieScreen({Key? key}) : super(key: key);

  @override
  State<TheMovieScreen> createState() => _TheMovieScreenState();
}

class _TheMovieScreenState extends State<TheMovieScreen> {
  final TheMovieCubit _movieCubit = injector<TheMovieCubit>();
  final ScrollController scrollController = ScrollController();
  bool _enableContinueLoadMore = true;

  @override
  void initState() {
    _movieCubit.getDataMovie();
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 200) {
      if (_enableContinueLoadMore) {
        _enableContinueLoadMore = false;
        _movieCubit.loadMoreDataMovies();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomGestureDetector(
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.grey9,
              ),
              onTap: () {},
            ),
            const Text(StringConst.back, style: AppTextTheme.style18pxGrey)
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  StringConst.popularList,
                  style: AppTextTheme.style20pxGrey,
                )),

            BlocBuilder<TheMovieCubit, TheMovieState>(
                bloc: _movieCubit,
                buildWhen: (_, state) {
                  return state is TheMovieGettingState ||
                      state is TheMovieGotDataState;
                },
                builder: (_, state){
                  if(state is TheMovieGettingState){
                    return CommonShimmer();
                  }
                  if(state is TheMovieGotDataState &&
                      (state.movies?.isNotEmpty ?? false)){
                    if (!state.isLastData) {
                      _enableContinueLoadMore = true;
                    }
                    return MovieGridview(
                      movieModels: state.movies ??[],
                    );
                  }
                  return CommonShimmer();
                }),

            BlocBuilder<TheMovieCubit, TheMovieState>(
                bloc: _movieCubit,
                builder: (_, state){
                  if(state is TheMovieLoadingMoreState){
                    return const CircleProgressLoadMore();
                  }
                  return const SizedBox();
                })
          ],
        ),
      ),
    );
  }
}
