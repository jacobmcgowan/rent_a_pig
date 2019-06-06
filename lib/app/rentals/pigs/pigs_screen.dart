import 'package:flutter/material.dart';
import 'package:rent_a_pig/app/rentals/pigs.dart';
import 'package:rent_a_pig/shared/models.dart';
import 'package:rent_a_pig/shared/services.dart';

/// Displays the list of pigs that are available for a job.
class PigsScreen extends StatefulWidget {
  /// The job to find pigs for.
  final String job;

  /// Creates a PigsScreen.
  PigsScreen({Key key, this.job}) : super(key: key);


  @override
  _PigsScreenState createState() {
    return new _PigsScreenState(
      job: job,
      title: job == null ? 'All Pigs' : 'Pigs for ' + job,
      pigs: PigsService.getPigs(job)
    );
  }
}


/// Handles the logic and internal state of a PigsScreen.
class _PigsScreenState extends State<PigsScreen> {
  /// The job to find pigs for.
  final String job;

  /// The title to display in the AppBar.
  final String title;

  /// The list of pigs to display.
  final List<Pig> pigs;

  /// Creates a _PigsScreenState.
  _PigsScreenState({this.job, this.title, this.pigs});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: _buildPigsList(),
        ),
      ),
    );
  }

  /// Builds the pigs list.
  Widget _buildPigsList() {
    Widget pigSummaries = pigs.length > 0 ?
      Column(
        children: pigs
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