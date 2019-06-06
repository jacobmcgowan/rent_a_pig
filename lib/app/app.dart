import 'package:flutter/material.dart';
import 'package:rent_a_pig/app/app_config.dart';
import 'package:rent_a_pig/app/rentals.dart';

/// The base widget for the app.
class App extends StatelessWidget {
  /// Creates an App.
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppConfig config = AppConfig.of(context);

    return MaterialApp(
      title: config.appName,
      // A lot of styling is done though themes. See
      // https://flutter.dev/docs/cookbook/design/themes
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JobsScreen()
    );
  }
}