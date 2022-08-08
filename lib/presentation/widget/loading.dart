import 'package:flutter/material.dart';

class CircleProgressLoadMore extends StatelessWidget {

  const CircleProgressLoadMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          "assets/images/loading.gif",
          width: 80,
          height: 80,
        ),
      ),
    );
  }
}
