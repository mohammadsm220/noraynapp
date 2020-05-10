import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:noraynapp/Service/NewsStream.dart';
class NewsCard extends StatelessWidget {
  final String content;
  NewsCard({this.content});
  
  @override
  Widget build(BuildContext context) {
    var x = Provider.of<List<News>>(context);
    if(x.length !=null){
    return GestureDetector(
          child: Card(
        child: ListTile(
          title: Text(content.length>120?content.substring(0,120)+'...':content,style: TextStyle(fontSize: 18),),
        ),
      ),
      onTap: (){
        return showBottomSheet(context: context, builder: (context) => Container(
          child: Expanded(
            child: ListView(
              children: <Widget>[
                Text(content),
              ],
            ),
          ),
        ));
      },
    );}
    else{
      Card(
      child: ListTile(
        title: Text('yrfugoifdgiudsfg'),
      ),
    );
    }
  }
}
