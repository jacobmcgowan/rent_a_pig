import 'package:flutter/material.dart';
import 'package:rent_a_pig/app/rentals/pigs.dart';
import 'package:rent_a_pig/shared/models.dart';
import 'package:rent_a_pig/shared/services.dart';

class PigsScreen extends StatefulWidget {
  final String job;

  PigsScreen({Key key, this.job}) : super(key: key);


  @override
  PigsScreenState createState() {
    return new PigsScreenState(
      job: job,
      title: job == null ? 'All Pigs' : 'Pigs for ' + job,
      pigs: PigsService.getPigs(job)
    );
  }
}

class PigsScreenState extends State<PigsScreen> {
  final String job;
  final String title;
  final List<Pig> pigs;

  PigsScreenState({this.job, this.title, this.pigs});


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