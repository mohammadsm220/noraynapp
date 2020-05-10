import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:noraynapp/Service/Data.dart';
class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      // color: Color.(0xFF663e60),
      backgroundColor: Color(0xFF663e60),
      index: Provider.of<Data>(context).numPage,
      // type: BottomNavigationBarType.fixed,
      // currentIndex: Provider.of<Data>(context).numPage, 
      items: [
        // BottomNavigationBarItem(
           Icon(Icons.home,color: Color(0xFF663e60),),
          // title: new Text('Home',style: TextStyle(color: Color(0xFF663e60))),
        // ),
        // BottomNavigationBarItem(
           Icon(Icons.mail,color: Color(0xFF663e60),),
          // title: new Text('Messages',style: TextStyle(color: Color(0xFF663e60)),),
        // ),
        Image.asset('images/home.png',fit: BoxFit.cover,),
        // BottomNavigationBarItem(
          Icon(Icons.shopping_cart,color: Color(0xFF663e60),),
          // title: Text('Profile',style: TextStyle(color: Color(0xFF663e60))),
        // ),
        
        // BottomNavigationBarItem(
          Icon(Icons.school,color: Color(0xFF663e60),),
          // title: Text('Profile',style: TextStyle(color: Color(0xFF663e60))),
        // ),
        
        // Icon(Icon(),),
      ],
      onTap: (value){
      String page =Provider.of<Data>(context,listen: false).setPage(value);
      Navigator.popAndPushNamed(context, page);
      }
    );
  }
}
