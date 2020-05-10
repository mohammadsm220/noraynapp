import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:noraynapp/Service/ImageStream.dart';
import 'package:provider/provider.dart';
//import 'dart:html';

class SliderView extends StatelessWidget {
  SliderView({this.onCall});
  final Function onCall;
  // final List<String> image;
//  final String title;
//  final String body;
  @override
  Widget build(BuildContext context) {
    var images = Provider.of<List<ImagesStream>>(context);
    return Container(
      child: CarouselSlider.builder(
        itemCount: images.length,
        itemBuilder: (BuildContext context, int itemIndex) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: GestureDetector(
                onTap: () {
                  showBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      child: ListView(
                        children: <Widget>[
                          Image.network(images[itemIndex].imageURL),
                          Text('الخبر يكون هنا '),
                        ],
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2.0, 2.0), //(x,y)
                            blurRadius: 5.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: NetworkImage(
                            images[itemIndex].imageURL,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              height: 100,
                              child: Card(
                                color: Colors.white38,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text('الخبر يكون هنا ',
                                        style: TextStyle(fontSize: 18)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
//              enableInfiniteScroll: false,
          autoPlay: true,
          enlargeCenterPage: true,
          autoPlayInterval: Duration(seconds: 2),
        ),
      ),
    );
  }
}
