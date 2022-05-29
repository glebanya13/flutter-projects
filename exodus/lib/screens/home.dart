import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exodus/api/verse.dart';
import 'package:exodus/notifier/verse.dart';
import 'package:exodus/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:time_machine/time_machine.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    VerseNotifier verseNotifier =
        Provider.of<VerseNotifier>(context, listen: false);
    getVerse(verseNotifier);
    super.initState();
  }

  Widget build(BuildContext context) {
    VerseNotifier verseNotifier = Provider.of<VerseNotifier>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: titleWidget(
          context
        ),
        leading: Icon(Icons.fitness_center),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('days').orderBy('number').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text('No records',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    )));
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  elevation: 2.0,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Container(
                      decoration:
                      BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        title: Text(
                            'День ' +
                                snapshot.data!.docs[index].get('number').toString() +
                                ' —  ' +
                                '"' +
                                snapshot.data!.docs[index].get('title') +
                                '"',
                            style: TextStyle(
                                color: Theme.of(context).textTheme.title!.color,
                                fontWeight: FontWeight.bold)),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Theme.of(context).textTheme.title!.color),
                        onTap: () {
                          verseNotifier.currentVerse =
                          verseNotifier.verseList[index];
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                                return DayDetailsPage();
                              }));
                        },
                      )));
            },
          );
        },
      )
    );
  }
}

Widget titleWidget(BuildContext context) {
  LocalDateTime a = LocalDateTime.now();
  LocalDateTime b = LocalDateTime.dateTime(DateTime(2021, 9, 27, 0, 0, 0));
  Period diff = a.periodSince(b);

  return Text("День ${diff.days + 1}");
}


//
// Container(
// child: ListView.builder(
// itemBuilder: (BuildContext context, int index) {
// return Card(
// elevation: 2.0,
// margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
// child: Container(
// decoration:
// BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
// child: ListTile(
// contentPadding: EdgeInsets.symmetric(horizontal: 15),
// title: Text(
// 'День ' +
// verseNotifier.verseList[index].number +
// ' —  ' +
// '"' +
// verseNotifier.verseList[index].title +
// '"',
// style: TextStyle(
// color: Theme.of(context).textTheme.title!.color,
// fontWeight: FontWeight.bold)),
// trailing: Icon(Icons.keyboard_arrow_right,
// color: Theme.of(context).textTheme.title!.color),
// onTap: () {
// verseNotifier.currentVerse =
// verseNotifier.verseList[index];
// Navigator.of(context).push(
// MaterialPageRoute(builder: (BuildContext context) {
// return DetailsPage();
// }));
// },
// )));
// },
// itemCount: verseNotifier.verseList.length,
// ),
// ),
