import 'package:flutter/material.dart';
import 'package:noraynapp/Widgets/NavigationBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Noeayn extends StatelessWidget {
  const Noeayn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _launchURL(String url) async {
      // const url = 'https://twitter.com/NoraynLadies';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'حسابتنا',
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        maxRadius: 30,
                        minRadius: 30,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          'images/home.png',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              FloatingActionButton(
                                backgroundColor: Color(0xFFDD4B3E),
                                onPressed: () {
                                  _launchURL('https://g.page/noraynladies');
                                },
                                child: Icon(FontAwesomeIcons.mapPin),
                              ),
                              Text('الموقع'),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              FloatingActionButton(
                                backgroundColor: Color(0xFF1da1f2),
                                onPressed: () {
                                  _launchURL('https://twitter.com/NoraynLadies');
                                },
                                child: Icon(FontAwesomeIcons.twitter),
                              ),
                              Text('تويتر'),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              FloatingActionButton(
                                backgroundColor: Color(0xFFc32aa3),
                                onPressed: () {
                                  _launchURL(
                                      'https://www.instagram.com/noraynladies/');
                                },
                                child: Icon(FontAwesomeIcons.instagram),
                              ),
                              Text('أنستقرام'),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              FloatingActionButton(
                                backgroundColor: Color(0xFFfffc00),
                                onPressed: () {
                                  // _launchURL('https://g.page/noraynladies');
                                },
                                child: Icon(
                                  FontAwesomeIcons.snapchatGhost,
                                  color: Colors.black,
                                ),
                              ),
                              Text('سناب شات'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              FloatingActionButton(
                                child: Icon(FontAwesomeIcons.google),
                              ),
                              Text('الأيميل'),
                              Text('noraynladies'),
                              Text('@gmail.com'),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              FloatingActionButton(
                                backgroundColor: Color(0xFF25d366),
                                child: Icon(Icons.phone_android),
                              ),
                              Text('جوال'),
                              Text('0504246246'),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              FloatingActionButton(
                                child: Icon(Icons.phone_in_talk),
                              ),
                              Text('الرقم الموحد'),
                              Text('920008708'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Text(
                              'رقم الحساب البنكي للمجمع بمصرف الإنماء',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              'SA10050000-68202280196000',
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
}
