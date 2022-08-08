import 'package:flutter/material.dart';
import 'package:the_movie/presentation/screen/the_movie_screen/screen/the_movie_screen.dart';
import 'package:the_movie/presentation/injector_container.dart' as di;

void main() async{
  await initInjector();
  runApp(const MyApp());
}

Future initInjector() async {
  await di.init();
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Movie Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TheMovieScreen(),
    );
  }
}


