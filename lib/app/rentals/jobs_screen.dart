import 'package:flutter/material.dart';
import 'package:rent_a_pig/app/app_config.dart';
import 'package:rent_a_pig/app/rentals/pigs.dart';
import 'package:rent_a_pig/shared/services.dart';

/// Displays the list of jobs that pigs can be rented for.
class JobsScreen extends StatelessWidget {
  /// Creates a JobsScreen.
  JobsScreen({Key key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    // Inherited widgets are accessed with the static of method.
    AppConfig config = AppConfig.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(config.appName),
      ),
      body: Padding(
        // Flutter does not use CSS or anything like it. Instead there are
        // classes that are used to set specific types of styles.
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
                        // Navigate to the PigsScreen for the job and allow back
                        // navigation. Flutter will add a back button to the
                        // AppBar automatically as well as support the Android
                        // back button and back swiping on iOS.
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
