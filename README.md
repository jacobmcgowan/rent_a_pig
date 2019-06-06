# rent_a_pig

Example application used to demonstrate Flutter.

## Getting Started

1. Setup the Flutter SDK using the steps found in the
[get started documentation](https://flutter.dev/docs/get-started/install).
2. Start you Android or iOS VM.
3. Run the app using one of the following options:
  1. In Visual Studio Code press F5 to start debugging.
  2. If using another IDE, check the
  [editor setup documentation](https://flutter.dev/docs/get-started/editor?tab=androidstudio)
  and configure your debugger to start *lib/main_dev.dart* instead of *lib/main.dart*.
  3. Open a terminal and run `flutter run lib/main_dev.dart`.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view the 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## Environments

To handle different environment configurations, this example uses a AppConfig
class which takes advantage of the InheritedWidget class. Inherited widgets can
be passed through the build context and accessed in child widgets. We then
create a different separate main file, main_dev.dart and main_prod.dart, for
each environment that initializes the AppConfig with the settings for that
environment.
