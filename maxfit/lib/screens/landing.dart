import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maxfit/domain/client.dart';
import 'package:maxfit/screens/auth.dart';
import 'package:maxfit/screens/home.dart';
import 'package:maxfit/services/auth.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<Client?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<Client?> snapshot) {
          if(snapshot.connectionState == ConnectionState.active) {
            final Client? user = snapshot.data;
            return user == null ? AuthorizationPage() : HomePage();
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }
    );
  }

}
