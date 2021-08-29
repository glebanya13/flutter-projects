import 'package:flutter/material.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 30)),
                Text('f1ame', style: TextStyle(
                    fontSize: 25,
                    color: Colors.white
                )),
                Padding(padding: EdgeInsets.only(top: 10)),
                CircleAvatar(
                  backgroundImage: AssetImage('f1ame.jpg'),
                  radius: 50,
                ),
                Row(
                  children: [
                    Icon(Icons.mail_outline, size: 25, color: Colors.white),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text('glebanya.com@gmail.com', style: TextStyle(
                        color: Colors.white
                    ))
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/todo');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrangeAccent,
                    ),
                    child: Text('TodoList')),

              ],
            )
          ],
        ),
      ),
    );
  }
}

