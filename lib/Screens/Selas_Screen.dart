import 'package:flutter/material.dart';
import 'package:noraynapp/Widgets/NavigationBar.dart';
import 'package:noraynapp/Service/SalesStream.dart';
import 'package:provider/provider.dart';

class Sales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fireStore = Provider.of<List<SalesStream>>(context);
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F8),
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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: fireStore.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(2.5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2.0, 2.0), //(x,y)
                            blurRadius: 5.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                image: DecorationImage(
                                  image:
                                      NetworkImage(fireStore[index].imageURL),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text('السعر: مجانا'),
                                Text('الحالة: متوقر'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Align(
              child: NavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}
