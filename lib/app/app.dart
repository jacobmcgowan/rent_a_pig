import 'package:flutter/material.dart';
import 'package:rent_a_pig/app/app_config.dart';
import 'package:rent_a_pig/app/rentals.dart';

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppConfig config = AppConfig.of(context);

    return MaterialApp(
      title: config.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JobsScreen()
    );
  }
}