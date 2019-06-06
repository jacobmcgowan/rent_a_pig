import 'package:flutter/material.dart';
import 'package:rent_a_pig/shared/models/pig.dart';

/// Display the information about a pig for rent.
class PigSummary extends StatefulWidget {
  /// The pig to display.
  final Pig pig;

  /// Creates a PigSummary.
  PigSummary({Key key, this.pig}) : super(key: key);


  @override
  _PigSummaryState createState() {
    return new _PigSummaryState();
  }
}


/// Handles the logic and internal state of a PigSummary.
class _PigSummaryState extends State<PigSummary> {
  bool _rented = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(widget.pig.imagePath),
            ),
            title: Text(widget.pig.name),
            subtitle: Text('Sold by ${widget.pig.farmer}'),
          ),
          ButtonTheme.bar(
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Rent for \$${widget.pig.price}'),
                  // setting onPressed to null disables the button.
                  onPressed: _rented ? null : () => _rent(context),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Rents the pig, notfies the user and navigates back in the [context].
  void _rent(BuildContext context) {
    setState(() {
      _rented = true;
    });

    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Rented ${widget.pig.name} from ${widget.pig.farmer}'),
    ));
  }
}