// There are multiple ways to import other dart files:
//   Direct file path:  import 'app/app.dart';
//   Direct package:    import 'package:rent_a_pig/app/app.dart';
//   From library:      import 'package:rent_a_pig/app.dart';
import 'package:flutter/material.dart';
import 'package:rent_a_pig/app.dart';

/// Runs the app.
void main() => runApp(AppConfig(
    appName: 'Rent-a-Pig: Dev',
    child: App(),
  ));
