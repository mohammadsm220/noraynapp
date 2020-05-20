import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:noraynapp/Service/Data.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        backgroundColor: Color(0xFF663e60),
        index: Provider.of<Data>(context).numPage,
        items: [
          Icon(
            Icons.home,
            color: Color(0xFF663e60),
          ),
          Icon(
            Icons.mail,
            color: Color(0xFF663e60),
          ),
          Image.asset(
            'images/home.png',
            fit: BoxFit.cover,
          ),
          Icon(
            Icons.shopping_cart,
            color: Color(0xFF663e60),
          ),
          Icon(
            Icons.school,
            color: Color(0xFF663e60),
          ),
        ],
        onTap: (value) {
          if (value != Provider.of<Data>(context, listen: false).numPage) {
            String page =
                Provider.of<Data>(context, listen: false).setPage(value);
            Navigator.popAndPushNamed(context, page);
          }
        });
  }
}
//abdallah