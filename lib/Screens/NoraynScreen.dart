import 'package:flutter/material.dart';
import 'package:noraynapp/Widgets/NavigationBar.dart';

class Noeayn extends StatelessWidget {
  const Noeayn({Key key}) : super(key: key);

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
          Container(
            child: Column(
              children: <Widget>[
                Image.asset('images/home.png'),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: NavigationBar(),
            ),
          ),
        ],
      ),
    );
  }
}
