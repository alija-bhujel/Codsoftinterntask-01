import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: Colors.blue[700],
              )),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(isDark ? Icons.sunny : Icons.nightlight),
              color: Colors.blue[700],
            )
          ],
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 20, color: Colors.blue[700]),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://2.bp.blogspot.com/-rOsFHTGRetQ/UZrR_53ER6I/AAAAAAAAAFY/KuJRGXbT1QQ/s1600/Selena+Gomez+10.png'),
                  radius: 45,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Selena Gomez',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text('gomezselena22@gmail.com'),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 85,
              height: 35,
              child: Center(
                  child: Text(
                'Hey there!',
                style: TextStyle(color: Colors.white),
              )),
              decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(18)),
            )
          ],
        )));
  }
}
