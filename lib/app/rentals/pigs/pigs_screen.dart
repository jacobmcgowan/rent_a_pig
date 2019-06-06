import 'package:flutter/material.dart';
import 'package:rent_a_pig/app/rentals/pigs.dart';
import 'package:rent_a_pig/shared/models.dart';
import 'package:rent_a_pig/shared/services.dart';

/// Displays the list of pigs that are available for a job.
class PigsScreen extends StatelessWidget {
  /// The job to find pigs for.
  final String job;
  final String _title;
  final List<Pig> _pigs;

  // Classes that inherit from a widget should always be immutable. The
  // following constructor show an example of how to instantiate final fields
  // using some logic. 

  /// Creates a PigsScreen.
  PigsScreen({Key key, this.job}) :
    _title = job == null ? 'All Pigs' : 'Pigs for ' + job,
    _pigs = PigsService.getPigs(job),
    super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: _buildPigsList(context),
        ),
      ),
    );
  }


  /// Builds the pigs list.
  Widget _buildPigsList(BuildContext context) {
    Widget pigSummaries = _pigs.length > 0 ?
      Column(
        children: _pigs
          .map((pig) => PigSummary(pig: pig,))
          .toList()
        ) :
      Center(
        child: Text(
          'No pigs available for the job',
          style: Theme.of(context).textTheme.headline,
        ),
      );

    return job == 'Tea Party' ?
      Column(
        children: <Widget>[
          Center(
            child: Text('Really? Fine, here are some pigs.'),
          ),
          Center(
            child: pigSummaries,
          )
        ],
      ) :
      pigSummaries;
  }
}
