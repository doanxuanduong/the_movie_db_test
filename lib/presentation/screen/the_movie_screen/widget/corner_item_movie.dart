import 'package:flutter/material.dart';
import 'package:the_movie/presentation/themes/theme_color.dart';
import 'package:the_movie/presentation/themes/theme_text.dart';

class CornerItemMovie extends StatelessWidget {
  final String? title;
  const CornerItemMovie({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return title == null
        ? const SizedBox()
        : ClipOval(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: AppColors.gradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  style: AppTextTheme.style12White
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                  children: [
                    TextSpan(
                      text: "${title![0] != "" ? title![0] : 0}",
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0.0, -4.0),
                        child: Text(
                          '.${title![2] != "" ? title![2] : 0}',
                          style: AppTextTheme.style12White,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
