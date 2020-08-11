import 'package:flutter/material.dart';
import '../note.dart';
import '../widgets/Note.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> _notes = [];


  void _addNote() async {
    Note note = await Navigator.push(context, MaterialPageRoute<Note>(
      builder: (context) {
        Note note = Note();

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: TextField(
              decoration: InputDecoration(
                hintText: 'Título',
              ),
              textCapitalization: TextCapitalization.sentences,
              onSubmitted: (value) {note.title = value;},
              onChanged: (value) {note.title = value;},
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    Navigator.pop(context, note);
                  }
              )
            ],
          ),
          body: Container(
            color: Colors.amber,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ingrese una nota'
              ),
              expands: true,
              maxLines: null,
              minLines: null,
              onSubmitted: (value) {note.body = value;},
              onChanged: (value) {note.body = value;},
            ),
          ),
        );
      }
    ));

    if (note == null)
      return null;

    setState(() {
      _notes.add(note);
    });

  }

  Widget _getNotes() {
    if (_notes.isEmpty) {
      return Center(
        child: Text('No hay notas.'),
      );
    }

    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: const EdgeInsets.all(8),
      childAspectRatio: 1,
      children: _notes.map<Widget>((note) {
        return NoteEntry(note: note);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title + ' - ' + _notes.length.toString()),
      ),
      body: _getNotes(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        tooltip: 'Añadir nota',
        child: Icon(Icons.add),
      ),
    );
  }
}

