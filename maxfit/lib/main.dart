import 'package:flutter/material.dart';
import 'package:maxfit/domain/client.dart';
import 'package:maxfit/screens/landing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:maxfit/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaxFitApp());
}

class MaxFitApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(create: (_) => AuthService())
        ],
        child: MaterialApp(
            title: "Max Fitness",
            theme: ThemeData(
                primaryColor: Color.fromRGBO(50, 65, 85,1),
                textTheme: TextTheme(title: TextStyle(color: Colors.white))
            ),
            home: LandingPage()
        )
    );
  }
}
