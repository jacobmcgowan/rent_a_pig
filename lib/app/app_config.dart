import 'package:flutter/material.dart';

/// Defines the configuration options for the app.
class AppConfig extends InheritedWidget {
  /// The name of the app.
  final String appName;

  /// Creates an AppConfig.
  /// 
  /// Initialize the configurat this is inherited by the given [child].
  AppConfig({@required this.appName, @required Widget child}) : super(child: child);


  /// Gets the AppConfig for the given [context].
  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}