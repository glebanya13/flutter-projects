import 'package:flutter/material.dart';
import 'package:todolist/screens/todo.dart';
import 'package:todolist/screens/profile.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.deepOrangeAccent
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Profile(),
          '/todo': (context) => Todo(),
        },
      ));
}