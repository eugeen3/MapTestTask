import 'package:flutter/material.dart';
import 'package:map_test_task/di/di.dart';
import 'package:map_test_task/presentation/main_page.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xffFFC137, {
          50: Color.fromRGBO(255, 193, 55, .1),
          100: Color.fromRGBO(255, 193, 55, .2),
          200: Color.fromRGBO(255, 193, 55, .3),
          300: Color.fromRGBO(255, 193, 55, .4),
          400: Color.fromRGBO(255, 193, 55, .5),
          500: Color.fromRGBO(255, 193, 55, .6),
          600: Color.fromRGBO(255, 193, 55, .7),
          700: Color.fromRGBO(255, 193, 55, .8),
          800: Color.fromRGBO(255, 193, 55, .9),
          900: Color.fromRGBO(255, 193, 55, 1),
        }),
      ),
      home: const MainPage(title: 'Allsports Map'),
    );
  }
}
