import 'package:exodus/notifier/verse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DayDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VerseNotifier verseNotifier = Provider.of<VerseNotifier>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Exodus'),
        leading: Icon(Icons.fitness_center),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Text('День ' + verseNotifier.currentVerse.number,
                    style: TextStyle(
                        fontSize: 22,
                        color: Theme.of(context).textTheme.title!.color,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(
                  ' "' + verseNotifier.currentVerse.title + '" ',
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).textTheme.title!.color,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Text('Исход ' + verseNotifier.currentVerse.verse,
                    style: TextStyle(
                        fontSize: 22,
                        color: Theme.of(context).textTheme.title!.color,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 30),
                Padding(
                    padding: EdgeInsets.all(9),
                    child: Text(verseNotifier.currentVerse.verseText,
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).textTheme.title!.color,
                            fontWeight: FontWeight.bold))),
                SizedBox(height: 30),
                Text('Комментарий',
                    style: TextStyle(
                        fontSize: 22,
                        color: Theme.of(context).textTheme.title!.color,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 30),
                Padding(
                    padding: EdgeInsets.all(9),
                    child: Text(verseNotifier.currentVerse.comment,
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).textTheme.title!.color,
                            fontWeight: FontWeight.bold))),
                Text('Упражнения',
                    style: TextStyle(
                        fontSize: 22,
                        color: Theme.of(context).textTheme.title!.color,
                        fontWeight: FontWeight.bold)),
                Padding(
                    padding: EdgeInsets.all(9),
                    child: Text(verseNotifier.currentVerse.exercises,
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).textTheme.title!.color,
                            fontWeight: FontWeight.bold))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}