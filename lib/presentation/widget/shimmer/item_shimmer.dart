import 'package:flutter/material.dart';
import 'package:the_movie/presentation/themes/theme_color.dart';

class ItemShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [

            Expanded(
              flex: 1,
              child:  Container(
                width: 120,
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              flex: 1,
              child:  Container(
                width: 120,
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
