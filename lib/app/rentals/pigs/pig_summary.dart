import 'package:flutter/material.dart';
import 'package:rent_a_pig/shared/models/pig.dart';

class PigSummary extends StatefulWidget {
  final Pig pig;

  PigSummary({Key key, this.pig}) : super(key: key);

  @override
  PigSummaryState createState() {
    return new PigSummaryState();
  }
}


class PigSummaryState extends State<PigSummary> {
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
                  onPressed: _rented ? null : () => _rent(context), // setting onPressed to null disables the button
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