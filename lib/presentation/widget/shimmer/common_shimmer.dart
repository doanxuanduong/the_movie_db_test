import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_movie/presentation/themes/theme_color.dart';
import 'package:the_movie/presentation/widget/shimmer/item_shimmer.dart';

class CommonShimmer extends StatefulWidget {
  final Widget? child;
  final int numberItem;

  CommonShimmer({Key? key, this.child, this.numberItem = 3}) : super(key: key);

  @override
  State<CommonShimmer> createState() => _CommonShimmerState();
}

class _CommonShimmerState extends State<CommonShimmer> {
  List<Widget>? _listWIdget;

  void _initData() {
    _listWIdget = [];
    for (int i = 0; i < widget.numberItem; i++) {
      _listWIdget!.add(ItemShimmer());
    }
  }

  @override
  Widget build(BuildContext context) {
    _initData();
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: Shimmer.fromColors(
        baseColor: AppColors.grey300,
        highlightColor: AppColors.grey100,
        child: widget.child ??
            Column(
              children: _listWIdget ?? [],
            ),
      ),
    );
  }
}
