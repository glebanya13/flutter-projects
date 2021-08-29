import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Todo extends StatefulWidget{
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {

  String _userToDO = "";
  List todoList = [];

  @override
  void initState() {
    super.initState();
  }

  void _menuOpen() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
            backgroundColor: Colors.grey[900],
            appBar: AppBar(
                title: Text('Menu'),
                centerTitle: true
            ),
            body: Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
                    },
                    child: Text('To MainScreen'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrangeAccent
                    )
                )
              ],
            ),
          );
        })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("TodoList"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: _menuOpen,
              icon: Icon(Icons.menu_outlined)
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData) return Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10), child: Text('No records', style: TextStyle(color: Colors.white, fontSize: 24, )));
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                    key: Key(snapshot.data!.docs[index].id),
                    child: Card(
                      child: ListTile(
                        title: Text(snapshot.data!.docs[index].get('item')),
                        trailing: IconButton(
                          icon: Icon(
                              Icons.delete_sweep,
                              color: Colors.deepOrangeAccent
                          ),
                          onPressed: () {
                            setState(() {
                              FirebaseFirestore.instance.collection('items').doc(snapshot.data!.docs[index].id).delete();
                            });
                          },
                        ),
                      ),
                    ),
                    onDismissed: (direction) {
                      // if(direction == DismissDirection.endToStart)
                      FirebaseFirestore.instance.collection('items').doc(snapshot.data!.docs[index].id).delete();
                    }
                );
              }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Добавить элемент"),
              content: TextField(
                onChanged: (String value) {
                  _userToDO = value;
                },
              ),
              actions: [
                ElevatedButton(
                    child: Text('Добавить'),
                    onPressed: () {
                      FirebaseFirestore.instance.collection('items').add({'item': _userToDO});
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrangeAccent
                    ))
              ],
            );
          });

        },
        backgroundColor: Colors.greenAccent,
        child: Icon(
          Icons.add_box,
          color: Colors.white,
        ),
      ),
    );
  }
}