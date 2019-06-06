import 'package:rent_a_pig/shared/models/pig.dart';

/// Provides access to the list of pigs.
class PigsService {
  // Dart does not have public or private keywords. Instead, the _ prefix is
  // used for private members and classes while the omission of the _ prefix is
  // used for public members and classes.
  static List<Pig> _pigs = [
    new Pig('Piggy', 'John Smith', 23.00, ['Tea Party', 'Therapy'], 'assets/images/piggy.jpg'),
    new Pig('Babe', 'Jill Smith', 47.99, ['Truffle Hunting', 'Therapy'], 'assets/images/babe.jpg')
  ];


  /// Returns a list of pigs that are available for the given [job].
  static List<Pig> getPigs([String job]) {
    return job == null ?
      _pigs :
      _pigs.where((pig) => pig.jobs.contains(job))
      .toList();
  }
}
