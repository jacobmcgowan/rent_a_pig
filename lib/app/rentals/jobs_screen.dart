import 'package:flutter/material.dart';
import 'package:rent_a_pig/app/app_config.dart';
import 'package:rent_a_pig/app/rentals/pigs.dart';
import 'package:rent_a_pig/shared/services.dart';

class JobsScreen extends StatelessWidget {
  JobsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppConfig config = AppConfig.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(config.appName),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  'What do you need a pig for?',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Center(
                child: Column(
                  children: JobsService.getJobs()
                    .map((job) => FlatButton(
                      child: Text(job),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PigsScreen(job: job)
                          )
                        );
                      },
                    ))
                    .toList(),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
