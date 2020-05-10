import 'package:flutter/material.dart';
import 'package:noraynapp/Widgets/NavigationBar.dart';
import 'package:url_launcher/url_launcher.dart';

class Activites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 10,
          backgroundColor: Colors.white,
          title: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                'images/home.png',
                fit: BoxFit.contain,
              ),
            ),
          )),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 14,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Card(
                    child: ListTile(
                      title: Text('الدورة الرمضانية'),
                    ),
                  ),
                  onTap: _launchURL,
                );
              },
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: NavigationBar(),
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    const url = 'https://twitter.com/NoraynLadies';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
