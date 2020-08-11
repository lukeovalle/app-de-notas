import 'package:flutter/material.dart';
import '../note.dart';

class NoteEntry extends StatefulWidget {
  NoteEntry({Key key, this.note}) : super(key: key);


  final Note note;

  @override
  _NoteEntryState createState() => _NoteEntryState();
}

class _NoteEntryState extends State<NoteEntry> {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.note.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(widget.note.body),
          ],
        ),
      )
    );

  }
}
