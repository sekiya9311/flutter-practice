import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator.'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      itemBuilder: (context, idx) {
        if (idx.isOdd) {
          return Divider();
        }
        final index = idx ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(final WordPair wPair) {
    final alreadySaved = _saved.contains(wPair);
    return ListTile(
      title: Text(wPair.asPascalCase, style: _biggerFont),
      trailing: alreadySaved
          ? Icon(Icons.favorite, color: Colors.red)
          : Icon(Icons.favorite_border),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(wPair);
          } else {
            _saved.add(wPair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      final tiles = _saved.map((p) {
        return ListTile(
          title: Text(
            p.asPascalCase,
            style: _biggerFont,
          ),
        );
      });
      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();
      return new Scaffold(
        appBar: AppBar(
          title: const Text('Saved suggestions'),
        ),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }
}
